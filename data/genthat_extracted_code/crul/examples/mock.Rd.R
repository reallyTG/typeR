library(crul)


### Name: mock
### Title: Mocking HTTP requests
### Aliases: mock

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D   # load webmockr
##D   library(webmockr)
##D   library(crul)
##D 
##D   URL <- "https://httpbin.org"
##D 
##D   # turn on mocking
##D   crul::mock()
##D 
##D   # stub a request
##D   stub_request("get", file.path(URL, "get"))
##D   webmockr:::webmockr_stub_registry
##D 
##D   # create an HTTP client
##D   (x <- HttpClient$new(url = URL))
##D 
##D   # make a request - matches stub - no real request made
##D   x$get('get')
##D 
##D   # allow net connect
##D   webmockr::webmockr_allow_net_connect()
##D   x$get('get', query = list(foo = "bar"))
##D   webmockr::webmockr_disable_net_connect()
##D   x$get('get', query = list(foo = "bar"))
##D }
##D 
## End(Not run)



