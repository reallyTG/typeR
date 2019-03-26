library(gaiah)


### Name: great_circle_raster
### Title: return a raster of great circle distances (in km)
### Aliases: great_circle_raster

### ** Examples

# We compute the great circle distance between the lat/long of my office in
# California, to every cell in the raster denoting the breeding habitat
# of Wilson's warbler:
gcr <- great_circle_raster(wiwa_breed, lat = 36.951564, long = -122.065116)

# plot that if you want
## Not run: 
##D plot(gcr)
##D lines(get_wrld_simpl())
## End(Not run)



