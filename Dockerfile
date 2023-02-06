FROM mcr.microsoft.com/devcontainers/go:0-1-bullseye
LABEL one.brotherday.vendor "Brother Day"
LABEL one.brotherday.image.authors "Steve Huguenin <steve@brotherday.one>"
LABEL version 1.0
LABEL description "Multi-stage Docker image for mainstream frontend"
LABEL license AGPL-3.0
WORKDIR /mainstream
ADD . .
RUN go build
FROM scratch
EXPOSE 80
COPY --from=0 /mainstream/ .
CMD /frontend
