library(raster)


### Name: match
### Title: Value matching for Raster* objects
### Aliases: match match,Raster-method %in% %in%,Raster-method
### Keywords: spatial methods

### ** Examples

r <- raster(nrow=10, ncol=10)
r[] <- 1:100
m <- match(r, c(5:10, 50:55))
n <- r %in% c(5:10, 50:55)



