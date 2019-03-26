library(raster)


### Name: clamp
### Title: Clamp values
### Aliases: clamp clamp,Raster-method clamp,numeric-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=12, nrows=12)
values(r) <- 1:ncell(r)
rc <- clamp(r, 25, 75) 
rc



