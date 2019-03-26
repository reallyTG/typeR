library(raster)


### Name: as.list
### Title: Create a list of RasterLayer objects
### Aliases: as.list,Raster-method
### Keywords: spatial methods

### ** Examples

r <- raster(ncol=3, nrow=3)
r[] <- 1:ncell(r)
as.list(r)

s <- stack(r,r*2,r*3)
as.list(s, r)



