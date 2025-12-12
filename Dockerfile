FROM python:3.12

ADD . /workdir
WORKDIR /workdir

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -r requirements.txt
# RUN python3 manage.py collectstatic

EXPOSE 8000
CMD ["gunicorn", "-b", ":8000", "project.wsgi", "--access-logfile", "-", "--error-logfile", "-"]
