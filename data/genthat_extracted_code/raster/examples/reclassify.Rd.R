library(raster)


### Name: reclassify
### Title: Reclassify
### Aliases: reclassify reclassify,Raster-method
### Keywords: spatial

### ** Examples


r <- raster(ncols=36, nrows=18)
r[] <- runif(ncell(r)) 
# reclassify the values into three groups 
# all values >= 0 and <= 0.25 become 1, etc.
m <- c(0, 0.25, 1,  0.25, 0.5, 2,  0.5, 1, 3)
rclmat <- matrix(m, ncol=3, byrow=TRUE)
rc <- reclassify(r, rclmat)

# equivalent to
rc <- reclassify(r, c(-Inf,0.25,1, 0.25,0.5,2, 0.5,Inf,3))



