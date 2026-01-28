FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    make \
    gcc \
    git \
    g++ \
    libz-dev \
    cmake \
    libopenmpi-dev \
    libeigen3-dev \
    libboost-dev \
    python3-dev \
    python3-matplotlib \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/cariboo22/karamelo.git /src \
    && cd /src \
    && cmake -DCMAKE_BUILD_TYPE=release build . \
    && make -j 2

WORKDIR ./src

VOLUME ["/src"]

ENTRYPOINT ["./karamelo"]
