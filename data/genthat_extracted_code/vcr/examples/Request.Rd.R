library(vcr)


### Name: Request
### Title: The request of an HTTPInteraction
### Aliases: Request
### Keywords: internal

### ** Examples

url <- "https://eu.httpbin.org/post"
body <- list(foo = "bar")
headers <- list(
  `User-Agent` = "libcurl/7.54.0 r-curl/3.2 crul/0.5.2",
  `Accept-Encoding` = "gzip, deflate",
  Accept = "application/json, text/xml, application/xml, */*"
)

(x <- Request$new("POST", url, body, headers))
x$body
x$method
x$uri
x$host
x$path
x$headers
h <- x$to_hash()
x$from_hash(h)



