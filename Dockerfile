FROM golang:1.22-alpine AS build

WORKDIR /app

RUN go mod init thaismegumi/hello

COPY app/*.go ./

RUN go build -o /hello

FROM scratch

COPY --from=build /hello /hello

CMD ["/hello"]