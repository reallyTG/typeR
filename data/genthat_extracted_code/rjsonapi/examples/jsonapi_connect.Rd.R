library(rjsonapi)


### Name: jsonapi_connect
### Title: Connection
### Aliases: jsonapi_connect

### ** Examples

## Not run: 
##D library("crul")
##D (conn <- jsonapi_connect("http://localhost:8088"))
##D conn$url
##D conn$version
##D conn$content_type
##D conn$status()
##D conn$routes()
##D conn$routes(verbose = TRUE)
##D 
##D # get data from speicific routes
##D conn$route("authors")
##D conn$route("chapters")
##D conn$route("authors/1")
##D conn$route("authors/1/books")
##D conn$route("chapters/5")
##D conn$route("chapters/5/book")
##D conn$route("chapters/5/relationships/book")
##D 
##D ## include
##D conn$route("authors/1", include = "books")
##D conn$route("authors/1", include = "photos")
##D conn$route("authors/1", include = "photos.title")
##D 
##D ## set curl options on jsonapi_connect() call
##D xx <- jsonapi_connect("http://localhost:8088", verbose = TRUE)
##D xx$opts
##D xx$status()
##D 
##D ## set headers on initializing the client
##D (conn <- jsonapi_connect("http://localhost:8088", headers = list(foo = "bar")))
##D 
##D ## errors
##D ### route doesn't exist
##D # conn$route("foobar")
##D 
##D ### document doesn't exist
##D # conn$route("authors/56")
## End(Not run)



