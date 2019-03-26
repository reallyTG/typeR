library(request)


### Name: api_error_handler
### Title: Error handler
### Aliases: api_error_handler

### ** Examples

## Not run: 
##D # Use functions from httr
##D api('https://api.github.com/') %>%
##D  api_error_handler(stop_for_status)
##D 
##D api('https://api.github.com/') %>%
##D  api_error_handler(warn_for_status)
##D 
##D # Custom error handling functions
##D my_stop <- function(x) {
##D   if (x$status > 200) {
##D      warning("nope, try again", call. = FALSE)
##D   }
##D }
##D api("http://httpbin.org/status/404") %>%
##D  api_error_handler(my_stop)
## End(Not run)



