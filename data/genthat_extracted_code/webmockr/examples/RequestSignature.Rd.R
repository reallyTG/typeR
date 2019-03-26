library(webmockr)


### Name: RequestSignature
### Title: General purpose request signature builder
### Aliases: RequestSignature
### Keywords: datasets

### ** Examples

# make request signature
x <- RequestSignature$new(method = "get", uri = "https:/httpbin.org/get")
# method
x$method
# uri
x$uri
# request signature to string
x$to_s()

# headers
w <- RequestSignature$new(
  method = "get",
  uri = "https:/httpbin.org/get",
  options = list(headers = list(`User-Agent` = "foobar", stuff = "things"))
)
w
w$headers
w$to_s()

# headers and body
bb <- RequestSignature$new(
  method = "get",
  uri = "https:/httpbin.org/get",
  options = list(
    headers = list(`User-Agent` = "foobar", stuff = "things"),
    body = list(a = "tables")
  )
)
bb
bb$headers
bb$body
bb$to_s()



