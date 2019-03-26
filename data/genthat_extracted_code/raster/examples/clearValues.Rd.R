library(raster)


### Name: clearValues
### Title: Clear values
### Aliases: clearValues
### Keywords: spatial methods

### ** Examples
 
r <- raster(ncol=10, nrow=10)
r[] <- 1:ncell(r)
r <- clearValues(r)



