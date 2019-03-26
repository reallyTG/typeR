library(vcr)


### Name: RequestHandler
### Title: RequestHandler
### Aliases: RequestHandler
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
##D x <- RequestHandler$new(crul_request)
##D # x$handle()
## End(Not run)



