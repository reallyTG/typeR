library(crul)


### Name: url_build
### Title: Build and parse URLs
### Aliases: url_build url_parse

### ** Examples

url_build("https://httpbin.org")
url_build("https://httpbin.org", "get")
url_build("https://httpbin.org", "post")
url_build("https://httpbin.org", "get", list(foo = "bar"))

url_parse("httpbin.org")
url_parse("http://httpbin.org")
url_parse(url = "https://httpbin.org")
url_parse("https://httpbin.org/get")
url_parse("https://httpbin.org/get?foo=bar")
url_parse("https://httpbin.org/get?foo=bar&stuff=things")
url_parse("https://httpbin.org/get?foo=bar&stuff=things[]")



