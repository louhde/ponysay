FROM python:3-slim-stretch

MAINTAINER Julie Hourcade <juliehhourcade@gmail.com>

RUN apt-get update && apt-get install -y wget unzip openssl texinfo && \
    wget -O ponysay.zip http://github.com/erkin/ponysay/archive/master.zip && \
    unzip ponysay.zip && \
    cd ponysay-master && \
    ./setup.py install --freedom=partial && \
    rm -rf /var/lib/apt/lists/* /ponysay.zip /ponysay-master /usr/lib/python*/__pycache__/*.pyc 

ENTRYPOINT ["/usr/bin/ponysay"]