library(shotGroups)


### Name: getMinCircle
### Title: Minimum enclosing circle for a set of 2D-points
### Aliases: getMinCircle getMinCircle.data.frame getMinCircle.default

### ** Examples

# coordinates given by a suitable data frame
mc <- getMinCircle(DFsavage)

# determine axis limits so that circle will be visible
xLims <- mc$ctr[1] + c(-mc$rad, mc$rad)
yLims <- mc$ctr[2] + c(-mc$rad, mc$rad)
plot(point.y ~ point.x, data=DFsavage,
     pch=16, asp=1, xlim=xLims, ylim=yLims)
drawCircle(mc, fg='blue')

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(20, 100, 15), 2), ncol=2)
##D getMinCircle(xy)
## End(Not run)



