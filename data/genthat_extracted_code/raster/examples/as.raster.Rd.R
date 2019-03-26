library(raster)


### Name: as.raster
### Title: Coerce to a 'raster' object
### Aliases: as.raster as.raster,RasterLayer-method
### Keywords: spatial methods

### ** Examples

r <- raster(ncol=3, nrow=3)
r[] <- 1:ncell(r)
as.raster(r)



