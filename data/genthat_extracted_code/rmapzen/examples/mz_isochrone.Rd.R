library(rmapzen)


### Name: mz_isochrone
### Title: Retrieve isochrones
### Aliases: mz_isochrone

### ** Examples

## Not run: 
##D mz_isochrone(
##D     mz_location(lat = 37.87416, lon = -122.2544),
##D     costing_model = mz_costing$auto(),
##D     contours = mz_contours(c(10, 20, 30))
##D )
##D 
##D # departure point can be specified as a geocode result
##D mz_isochrone(
##D     mz_geocode("UC Berkeley"),
##D     costing_model = mz_costing$pedestrian(),
##D     contours = mz_contours(c(10, 20, 30))
##D )
## End(Not run)




