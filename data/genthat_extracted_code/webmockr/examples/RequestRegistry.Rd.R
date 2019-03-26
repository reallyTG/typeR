library(webmockr)


### Name: RequestRegistry
### Title: Request registry
### Aliases: RequestRegistry
### Keywords: datasets

### ** Examples

x <- RequestRegistry$new()
x$register_request(request = "GET http://scottchamberlain.info")
x$register_request(request = "GET http://scottchamberlain.info")
x$register_request(request = "POST https://httpbin.org/post")
# print method to list requests
x

# hashes, and number of times each requested
x$request_signatures$hash

# reset the request registry
x$reset()



