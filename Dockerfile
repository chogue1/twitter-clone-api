FROM python:latest

LABEL version="1.0"
LABEL description="Twitter Clone API"

WORKDIR /

ADD . /

RUN python3 -m venv twitter-clone-api/.venv
RUN /bin/bash -c "source twitter-clone-api/.venv/bin/activate"

RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt

#CMD ["python3", "manage.py", "migrate", "\"", 
# "&&", "python3", "manage.py", "createsuperuser", "\",
# "&&", "python3", "manage.py", "runserver", "0.0.0.0:8000"]

RUN python3 manage.py migrate \
 && python3 manage.py createsuperuser \
 && python3 manage.py runserver 0.0.0.0:8000
