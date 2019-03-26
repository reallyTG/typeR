library(googleAuthR)


### Name: gar_api_generator
### Title: googleAuthR data fetch function generator
### Aliases: gar_api_generator

### ** Examples

## Not run: 
##D library(googleAuthR)
##D ## change the native googleAuthR scopes to the one needed.
##D options("googleAuthR.scopes.selected" =
##D   c("https://www.googleapis.com/auth/urlshortener"))
##D 
##D shorten_url <- function(url){
##D 
##D   body = list(
##D     longUrl = url
##D     )
##D 
##D   f <- gar_api_generator("https://www.googleapis.com/urlshortener/v1/url",
##D                       "POST",
##D                       data_parse_function = function(x) x$id)
##D 
##D    f(the_body = body)
##D  }
##D 
##D To use the above functions:
##D library(googleAuthR)
##D # go through authentication flow
##D gar_auth()
##D s <- shorten_url("http://markedmondson.me")
##D s
## End(Not run)





