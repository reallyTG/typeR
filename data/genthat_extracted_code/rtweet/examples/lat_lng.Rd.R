library(rtweet)


### Name: lat_lng
### Title: Adds single-point latitude and longitude variables to tweets
###   data.
### Aliases: lat_lng

### ** Examples


## Not run: 
##D 
##D ## stream tweets sent from the US
##D rt <- stream_tweets(lookup_coords("usa"), timeout = 10)
##D 
##D ## use lat_lng to recover full information geolocation data
##D rtll <- lat_lng(rt)
##D 
##D ## plot points
##D with(rtll, plot(lng, lat))
##D 
## End(Not run)




