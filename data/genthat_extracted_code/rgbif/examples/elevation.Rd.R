library(rgbif)


### Name: elevation
### Title: Get elevation for lat/long points from a data.frame or list of
###   points.
### Aliases: elevation

### ** Examples

## Not run: 
##D user <- Sys.getenv("GEONAMES_USER")
##D 
##D occ_key <- name_suggest('Puma concolor')$key[1]
##D dat <- occ_search(taxonKey = occ_key, return = 'data', limit = 300,
##D   hasCoordinate = TRUE)
##D head( elevation(dat, username = user) )
##D 
##D # Pass in a vector of lat's and a vector of long's
##D elevation(latitude = dat$decimalLatitude[1:10],
##D   longitude = dat$decimalLongitude[1:10],
##D   username = user, verbose = TRUE)
##D 
##D # Pass in lat/long pairs in a single vector
##D pairs <- list(c(31.8496,-110.576060), c(29.15503,-103.59828))
##D elevation(latlong=pairs, username = user)
##D 
##D # Pass on curl options
##D pairs <- list(c(31.8496,-110.576060), c(29.15503,-103.59828))
##D elevation(latlong=pairs, username = user, verbose = TRUE)
##D 
##D # different elevation models
##D lats <- dat$decimalLatitude[1:5]
##D lons <- dat$decimalLongitude[1:5]
##D elevation(latitude = lats, longitude = lons, elevation_model = "srtm3", verbose = TRUE)
##D elevation(latitude = lats, longitude = lons, elevation_model = "srtm1", verbose = TRUE)
##D elevation(latitude = lats, longitude = lons, elevation_model = "astergdem", verbose = TRUE)
##D elevation(latitude = lats, longitude = lons, elevation_model = "gtopo30", verbose = TRUE)
## End(Not run)



