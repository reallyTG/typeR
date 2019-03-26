library(httpuv)


### Name: runServer
### Title: Run a server
### Aliases: runServer

### ** Examples

## Not run: 
##D # A very basic application
##D runServer("0.0.0.0", 5000,
##D   list(
##D     call = function(req) {
##D       list(
##D         status = 200L,
##D         headers = list(
##D           'Content-Type' = 'text/html'
##D         ),
##D         body = "Hello world!"
##D       )
##D     }
##D   )
##D )
## End(Not run)



