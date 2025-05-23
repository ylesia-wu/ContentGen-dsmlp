# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

# RUN pip install --no-cache-dir networkx scipy
# RUN pip install --no-cache-dir -r /tmp/requirements.txt
RUN pip install --no-cache-dir google-generativeai
RUN pip install --no-cache-dir google-api-python-client
RUN pip install --no-cache-dir google-auth
RUN pip install --no-cache-dir google-auth-httplib2
RUN pip install --no-cache-dir httplib2
RUN pip install --no-cache-dir requests
RUN pip install --no-cache-dir beautifulsoup4
RUN pip install --no-cache-dir python-dotenv
RUN pip install --no-cache-dir server_extension

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
