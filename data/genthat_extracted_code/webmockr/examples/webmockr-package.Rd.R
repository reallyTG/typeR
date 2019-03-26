library(webmockr)


### Name: webmockr-package
### Title: Stubbing and setting expectations on HTTP requests
### Aliases: webmockr-package webmockr
### Keywords: package

### ** Examples

library(webmockr)
stub_request("get", "https://httpbin.org/get")
stub_request("post", "https://httpbin.org/post")
stub_registry()



