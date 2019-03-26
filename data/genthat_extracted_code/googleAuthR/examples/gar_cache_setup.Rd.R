library(googleAuthR)


### Name: gar_cache_get_loc
### Title: Setup where to put cache
### Aliases: gar_cache_get_loc gar_cache_empty gar_cache_setup

### ** Examples


## Not run: 
##D 
##D # demo function to cache within
##D shorten_url_cache <- function(url){
##D   body = list(longUrl = url)
##D   f <- gar_api_generator("https://www.googleapis.com/urlshortener/v1/url",
##D                       "POST",
##D                       data_parse_function = function(x) x)
##D  f(the_body = body)
##D  
##D  }
##D  
##D  ## only cache if this URL
##D  gar_cache_setup(invalid_func = function(req){
##D       req$content$longUrl == "http://code.markedmondson.me/"
##D  })
##D  
##D  # authentication
##D  gar_auth()
##D  ## caches
##D  shorten_url_cache("http://code.markedmondson.me")
##D  
##D  ## read cache
##D  shorten_url("http://code.markedmondson.me")
##D  
##D  ## ..but dont cache me
##D  shorten_url_cache("http://blahblah.com")
##D 
## End(Not run)




