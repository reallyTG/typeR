library(rtweet)


### Name: lookup_coords
### Title: Get coordinates of specified location.
### Aliases: lookup_coords

### ** Examples


## Not run: 
##D 
##D ## get coordinates associated with the following addresses/components
##D sf <- lookup_coords("san francisco, CA", "country:US")
##D usa <- lookup_coords("usa")
##D lnd <- lookup_coords("london")
##D bz <- lookup_coords("brazil")
##D 
##D ## pass a returned coords object to search_tweets
##D bztw <- search_tweets(geocode = bz)
##D 
##D ## or stream tweets
##D ustw <- stream_tweets(usa, timeout = 10)
##D 
## End(Not run)




