library(webmockr)


### Name: remove_request_stub
### Title: Remove a request stub
### Aliases: remove_request_stub

### ** Examples

(x <- stub_request("get", "https://httpbin.org/get"))
stub_registry()
remove_request_stub(x)
stub_registry()



