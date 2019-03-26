library(raster)


### Name: cut
### Title: Convert values to classes
### Aliases: cut cut,Raster-method
### Keywords: spatial

### ** Examples


r <- raster(ncols=36, nrows=18)
r[] <- rnorm(ncell(r)) 
breaks <- -2:2 * 3
rc <- cut(r, breaks=breaks)



