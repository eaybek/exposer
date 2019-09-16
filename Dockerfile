FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install \
    python3 \
    python3-venv \
    python3-pip

RUN pip3 install setuptools
RUN mkdir -p /root/packages
RUN pip3 install gunicorn
RUN echo echo

COPY $PWD /root/packages/exposer/
RUN pip3 install /root/packages/exposer
WORKDIR /root/packages/exposer

RUN echo "pythonpath = '/usr/bin/python3'" >> guniconf
RUN echo "workers = 3" >> guniconf
CMD ["python3","sample/sample.py"]


