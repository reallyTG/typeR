library(webmockr)


### Name: HttrAdapter
### Title: httr library adapter
### Aliases: HttrAdapter
### Keywords: datasets

### ** Examples

## Not run: 
##D if (requireNamespace("httr", quietly = TRUE)) {
##D library(httr)
##D 
##D # normal httr request, works fine
##D real <- GET("https://httpbin.org/get")
##D real
##D 
##D # with webmockr
##D library(webmockr)
##D ## turn on httr mocking
##D httr_mock()
##D ## now this request isn't allowed
##D # GET("https://httpbin.org/get")
##D ## stub the request
##D stub_request('get', uri = 'https://httpbin.org/get') %>%
##D   wi_th(
##D     headers = list('Accept' = 'application/json, text/xml, application/xml, */*')
##D   ) %>%
##D   to_return(status = 418, body = "I'm a teapot!", headers = list(a = 5))
##D ## now the request succeeds and returns a mocked response
##D (res <- GET("https://httpbin.org/get"))
##D res$status_code
##D rawToChar(res$content)
##D 
##D # allow real requests while webmockr is loaded
##D webmockr_allow_net_connect()
##D webmockr_net_connect_allowed()
##D GET("https://httpbin.org/get?animal=chicken")
##D webmockr_disable_net_connect()
##D webmockr_net_connect_allowed()
##D # GET("https://httpbin.org/get?animal=chicken")
##D }
## End(Not run)



