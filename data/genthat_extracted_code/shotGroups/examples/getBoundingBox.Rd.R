library(shotGroups)


### Name: getBoundingBox
### Title: Bounding box for a set of 2D-points
### Aliases: getBoundingBox getBoundingBox.data.frame
###   getBoundingBox.default

### ** Examples

# coordinates given by a suitable data frame
bb <- getBoundingBox(DFsavage)

# draw points and bounding box
plot(point.y ~ point.x, data=DFsavage, asp=1, pch=16)
drawBox(bb, fg='blue', colCtr='blue', pch=4, cex=2)

bb$FoM                                   # figure of merit

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(20, 100, 15), 1), ncol=2)
##D getBoundingBox(xy)
## End(Not run)



