FROM nvidia/cuda:10.0-devel-ubuntu18.04

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y install \
        git make cmake build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
        libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils \
        libffi-dev liblzma-dev libblas-dev libturbojpeg liblapack-dev \
        libpq-dev libreadline-dev libsqlite3-dev \
        libssl-dev libxml2-dev libxslt1-dev

RUN git clone git://github.com/yyuu/pyenv.git .pyenv \
&& git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

ENV HOME  /
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 3.7.9 && pyenv global 3.7.9 && pip install -U pip
