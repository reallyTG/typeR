library(googleAuthR)


### Name: gar_batch
### Title: Turn a list of gar_fetch_functions into batch functions
### Aliases: gar_batch

### ** Examples


## Not run: 
##D 
##D ## usually set on package load
##D options(googleAuthR.batch_endpoint = "https://www.googleapis.com/batch/urlshortener/v1")
##D 
##D ## from goo.gl API
##D shorten_url <- function(url){
##D   body = list(longUrl = url)
##D   f <- gar_api_generator("https://www.googleapis.com/urlshortener/v1/url",
##D                          "POST",
##D                           data_parse_function = function(x) x$id)
##D                         
##D   f(the_body = body)
##D }
##D 
##D 
##D ## from goo.gl API
##D user_history <- function(){
##D   f <- gar_api_generator("https://www.googleapis.com/urlshortener/v1/url/history",
##D                       "GET",
##D                       data_parse_function = function(x) x$items)
##D                       
##D   f()
##D }
##D 
##D gar_batch(list(shorten_url("http://markedmondson.me"), user_history()))
##D 
## End(Not run)



