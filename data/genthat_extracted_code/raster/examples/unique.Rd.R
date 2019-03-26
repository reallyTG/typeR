library(raster)


### Name: unique
### Title: Unique values
### Aliases: unique unique,RasterLayer,missing-method
###   unique,RasterStackBrick,missing-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
r[] <- round(runif(ncell(r))*10)
unique(r)
unique(stack(r, round(r/2)))



