library(vcr)


### Name: RequestHandlerCrul
### Title: RequestHandlerCrul - methods for crul package
### Aliases: RequestHandlerCrul
### Keywords: datasets

### ** Examples

## Not run: 
##D vcr_configure(
##D  dir = tempdir(),
##D  record = "once"
##D )
##D 
##D data(crul_request)
##D crul_request$url$handle <- curl::new_handle()
##D crul_request
##D x <- RequestHandlerCrul$new(crul_request)
##D # x$handle()
## End(Not run)



