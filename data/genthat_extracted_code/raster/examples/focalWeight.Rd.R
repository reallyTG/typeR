library(raster)


### Name: focalWeight
### Title: Focal weights matrix
### Aliases: focalWeight
### Keywords: spatial

### ** Examples

r <- raster(ncols=36, nrows=18, xmn=0)
# Gaussian filter for square cells
gf <- focalWeight(r, 2, "Gauss")



