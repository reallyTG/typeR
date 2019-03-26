library(webmockr)


### Name: StubRegistry
### Title: Stub registry
### Aliases: StubRegistry
### Keywords: datasets

### ** Examples

## Not run: 
##D # Make a stub
##D stub1 <- StubbedRequest$new(method = "get", uri = "api.crossref.org")
##D stub1$with(headers = list('User-Agent' = 'R'))
##D stub1$to_return(status = 200, body = "foobar", headers = list())
##D stub1
##D 
##D # Make another stub
##D stub2 <- StubbedRequest$new(method = "get", uri = "api.crossref.org")
##D stub2
##D 
##D # Put both stubs in the stub registry
##D reg <- StubRegistry$new()
##D reg$register_stub(stub = stub1)
##D reg$register_stub(stub = stub2)
##D reg
##D reg$request_stubs
## End(Not run)



