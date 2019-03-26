library(shotGroups)


### Name: getMaxPairDist
### Title: Maximum pairwise distance for a set of points
### Aliases: getMaxPairDist getMaxPairDist.data.frame
###   getMaxPairDist.default

### ** Examples

# coordinates given by a suitable data frame
(maxPD <- getMaxPairDist(DFsavage))

# plot points and point pair with maximum distance
plot(point.y ~ point.x, data=DFsavage, asp=1, pch=16)
x0 <- DFsavage$point.x[maxPD$idx[1]]     # 1st point x
y0 <- DFsavage$point.y[maxPD$idx[1]]     # 1st point y
x1 <- DFsavage$point.x[maxPD$idx[2]]     # 2nd point x
y1 <- DFsavage$point.y[maxPD$idx[2]]     # 2nd point y
segments(x0, y0, x1, y1, col="green3", lwd=2)

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(20, 100, 15), 1), ncol=2)
##D getMaxPairDist(xy)
## End(Not run)



