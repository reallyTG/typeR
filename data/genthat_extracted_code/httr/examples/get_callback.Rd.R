library(httr)


### Name: get_callback
### Title: Install or uninstall a callback function
### Aliases: get_callback set_callback

### ** Examples

## Not run: 
##D ## Log all HTTP requests to the screeen
##D req_logger <- function(req) {
##D   cat("HTTP request to", sQuote(req$url), "\n")
##D }
##D 
##D old <- set_callback("request", req_logger)
##D g1 <- GET("https://httpbin.org")
##D g2 <- GET("https://httpbin.org/ip")
##D set_callback("request", old)
##D 
##D ## Log all HTTP requests and response status codes as well
##D req_logger2 <- function(req) {
##D   cat("HTTP request to", sQuote(req$url), "... ")
##D }
##D res_logger <- function(req, res) {
##D   cat(res$status_code, "\n")
##D }
##D 
##D old_req <- set_callback("request", req_logger2)
##D old_res <- set_callback("response", res_logger)
##D g3 <- GET("https://httpbin.org")
##D g4 <- GET("https://httpbin.org/ip")
##D set_callback("request", old_req)
##D set_callback("response", old_res)
##D 
##D ## Return a recorded response, without performing the HTTP request
##D replay <- function(req) {
##D   if (req$url == "https://httpbin.org") g3
##D }
##D old_req <- set_callback("request", replay)
##D grec <- GET("https://httpbin.org")
##D grec$date == g3$date
##D set_callback("request", old_req)
## End(Not run)




