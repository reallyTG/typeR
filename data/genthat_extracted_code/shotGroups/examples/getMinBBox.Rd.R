library(shotGroups)


### Name: getMinBBox
### Title: Minimum-area bounding box for a set of 2D-points
### Aliases: getMinBBox getMinBBox.data.frame getMinBBox.default

### ** Examples

# coordinates given by a suitable data frame
bb <- getMinBBox(DFsavage)               # minimum bounding box

# plot points and minimum bounding box
plot(point.y ~ point.x, data=DFsavage, asp=1,
     xlim=range(bb$pts[ , 1]), ylim=range(bb$pts[ , 2]), pch=16)
drawBox2(bb, fg='blue', colCtr='blue', pch=4, cex=2)

bb$FoM                                   # figure of merit
bb$angle                                 # box orientation

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(16, 100, 15)), ncol=2)
##D getMinBBox(xy)
## End(Not run)



