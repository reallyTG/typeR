library(rjsonapi)


### Name: jsonapi_server
### Title: Start a JSONAPI server
### Aliases: jsonapi_server

### ** Examples

## Not run: 
##D # start server in another R session
##D if (interactive()) {
##D   jsonapi_server()
##D 
##D   # Back in this session ...
##D   # Connect
##D   (conn <- jsonapi_connect("http://localhost:8000"))
##D 
##D   # Get data
##D   conn$url
##D   conn$version
##D   conn$content_type
##D   conn$routes()
##D   conn$route("authors")
##D   conn$route("chapters")
##D   conn$route("authors/1")
##D   conn$route("authors/1/books")
##D   conn$route("chapters/5")
##D }
## End(Not run)



