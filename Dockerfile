FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
RUN apt install unzip -y
RUN apt install nginx -y
RUN curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr/local sh
WORKDIR /usr/src/app
COPY index.js ./
COPY . .
EXPOSE 8000
CMD ["deno", "run", "--allow-net", "index.js"]