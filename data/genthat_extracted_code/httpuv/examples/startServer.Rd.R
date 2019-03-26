library(httpuv)


### Name: startServer
### Title: Create an HTTP/WebSocket server
### Aliases: startServer startPipeServer

### ** Examples

## Not run: 
##D # A very basic application
##D s <- startServer("0.0.0.0", 5000,
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
##D 
##D s$stop()
##D 
##D 
##D # An application that serves static assets at the URL paths /assets and /lib
##D s <- startServer("0.0.0.0", 5000,
##D   list(
##D     call = function(req) {
##D       list(
##D         status = 200L,
##D         headers = list(
##D           'Content-Type' = 'text/html'
##D         ),
##D         body = "Hello world!"
##D       )
##D     },
##D     staticPaths = list(
##D       "/assets" = "content/assets/",
##D       "/lib" = staticPath(
##D         "content/lib",
##D         indexhtml = FALSE
##D       ),
##D       # This subdirectory of /lib should always be handled by the R code path
##D       "/lib/dynamic" = excludeStaticPath()
##D     ),
##D     staticPathOptions = staticPathOptions(
##D       indexhtml = TRUE
##D     )
##D   )
##D )
##D 
##D s$stop()
## End(Not run)



