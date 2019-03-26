library(httptest)


### Name: capture_requests
### Title: Record API responses as mock files
### Aliases: capture_requests start_capturing stop_capturing

### ** Examples

## Not run: 
##D capture_requests({
##D     GET("http://httpbin.org/get")
##D     GET("http://httpbin.org")
##D     GET("http://httpbin.org/response-headers",
##D         query=list(`Content-Type`="application/json"))
##D })
##D # Or:
##D start_capturing()
##D GET("http://httpbin.org/get")
##D GET("http://httpbin.org")
##D GET("http://httpbin.org/response-headers",
##D     query=list(`Content-Type`="application/json"))
##D stop_capturing()
## End(Not run)



