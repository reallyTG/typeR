library(SkyWatchr)


### Name: getPolygon
### Title: Get the boundary box for a given dataset retrieved in a query
### Aliases: getPolygon
### Keywords: spatial

### ** Examples

## Not run: 
##D api_key <- "your_personal_alphanumeric_api_key"
##D 
##D # Set the SkyWatchr.apikey option 
##D options(SkyWatchr.apikey = api_key)
##D 
##D res <- querySW(time_period = "2015-8", longitude_latitude = "-71.1043443,-42.3150676")
##D sppolygon <- getPolygon(res, 61)
##D 
##D library(mapview)
##D mapView(sppolygon)
## End(Not run)



