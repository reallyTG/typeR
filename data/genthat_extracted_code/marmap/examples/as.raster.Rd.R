library(marmap)


### Name: as.raster
### Title: Convert bathymetric data to a raster layer
### Aliases: as.raster

### ** Examples

# load Hawaii bathymetric data
data(hawaii)

# use as.raster
r.hawaii <- as.raster(hawaii)

# class "RasterLayer"
class(r.hawaii)

# Summaries
summary(hawaii)
summary(r.hawaii)

# structure of the RasterLayer object
str(r.hawaii)

## Not run: 
##D # Plots
##D #require(raster)
##D plot(hawaii,image=TRUE,lwd=.2)
##D plot(r.hawaii)
## End(Not run)



