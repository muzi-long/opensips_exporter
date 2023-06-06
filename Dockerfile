# build
FROM golang:1.18 as builder

WORKDIR /go/src
COPY . /go/src/
RUN CGO_ENABLED=0 go build -a -o opensips_exporter

# run
FROM alpine

COPY --from=builder /go/src/opensips_exporter /opensips_exporter
EXPOSE 9434
ENTRYPOINT [ "/opensips_exporter" ]