library(raster)


### Name: extent
### Title: Extent
### Aliases: extent extent,Extent-method extent,BasicRaster-method
###   extent,Spatial-method extent,sf-method extent,matrix-method
###   extent,numeric-method extent,list-method extent,GridTopology-method
###   bbox,Raster-method bbox,Extent-method
### Keywords: spatial

### ** Examples

r <- raster()
extent(r)
extent(c(0, 20, 0, 20))
#is equivalent to
extent(0, 20, 0, 20)
extent(matrix(c(0, 0, 20, 20), nrow=2))
x <- list(x=c(0,1,2), y=c(-3,5))
extent(x)

#crop the extent by row and column numbers
extent(r, 1, 20, 10, 30)



