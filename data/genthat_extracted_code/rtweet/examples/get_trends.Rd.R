library(rtweet)


### Name: get_trends
### Title: Get Twitter trends data.
### Aliases: get_trends

### ** Examples


## Not run: 
##D 
##D ## Retrieve available trends
##D trends <- trends_available()
##D trends
##D 
##D ## Store WOEID for Worldwide trends
##D worldwide <- trends$woeid[grep("world", trends$name, ignore.case = TRUE)[1]]
##D 
##D ## Retrieve worldwide trends datadata
##D ww_trends <- get_trends(worldwide)
##D 
##D ## Preview trends data
##D ww_trends
##D 
##D ## Retrieve trends data using latitude, longitude near New York City
##D nyc_trends <- get_trends_closest(lat = 40.7, lng = -74.0)
##D 
##D ## should be same result if lat/long supplied as first argument
##D nyc_trends <- get_trends_closest(c(40.7, -74.0))
##D 
##D ## Preview trends data
##D nyc_trends
##D 
##D ## Provide a city or location name using a regular expression string to
##D ## have the function internals do the WOEID lookup/matching for you
##D (luk <- get_trends("london"))
##D 
## End(Not run)




