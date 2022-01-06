FROM golang:1.17-buster as build

WORKDIR /go/src/app
ADD . /go/src/app
RUN go build -o /go/bin/wrapdrive

FROM gcr.io/distroless/base-debian11
LABEL org.opencontainers.iamge.authors="secure@brickdoc.com"
LABEL org.opencontainers.image.source = "https://github.com/brickdoc/wrapdrive"
COPY --from=build /go/bin/wrapdrive /
CMD ["/wrapdrive"]