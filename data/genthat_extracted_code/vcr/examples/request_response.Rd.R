library(vcr)


### Name: request_response
### Title: request and response summary methods
### Aliases: request_response request_summary response_summary
### Keywords: internal

### ** Examples

# request
url <- "https://httpbin.org"
body <- list(foo = "bar")
headers <- list(
  `User-Agent` = "r-curl/3.2",
  `Accept-Encoding` = "gzip, deflate",
  Accept = "application/json"
)

(x <- Request$new("POST", url, body, headers))
request_summary(request = x)
request_summary(request = x, c('method', 'uri'))
request_summary(request = x, c('method', 'uri', 'body'))
request_summary(request = x, c('method', 'uri', 'headers'))
request_summary(request = x, c('method', 'uri', 'body', 'headers'))

# response
status <- list(status_code = 200, message = "OK",
  explanation = "Request fulfilled, document follows")
headers <- list(
  status = "HTTP/1.1 200 OK",
  connection = "keep-alive",
  date = "Tue, 24 Apr 2018 04:46:56 GMT"
)
response_body <- "{\"args\": {\"q\": \"stuff\"}, \"headers\": {\"Accept\": \"application/json\"}}\n"
(x <- VcrResponse$new(status, headers,
   response_body, "HTTP/1.1 200 OK"))
response_summary(x)



