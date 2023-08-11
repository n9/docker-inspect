ARG BASE_IMAGE_VERSION
ARG BASE_IMAGE=mcr.microsoft.com/powershell:$BASE_IMAGE_VERSION

FROM $BASE_IMAGE

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bash git openssh-server rsync mc gpg lsof htop \
    nano xxd build-essential fio \
    dnsutils wget curl nmap iputils-ping netcat tcpdump \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*