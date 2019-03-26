library(OpenRepGrid)


### Name: calcCoordsBorders
### Title: Coordinates of a sourrounding rectangle in direction of a given
###   vector.
### Aliases: calcCoordsBorders
### Keywords: internal

### ** Examples

## Not run: 
##D   calcCoordsBorders(1:10, 10:1)
##D 
##D   x <- c(-100:0, 0:100, 100:0, 0:-100)/10
##D   y <- c(0:100, 100:0, -(0:100), -(100:0))/10
##D   xy1 <- calcCoordsBorders(x, y)
##D   xy2 <- calcCoordsBorders(x, y, xm=1.2, ym=1.2)
##D   plot(xy2[,1], xy2[,2], type="n")
##D   segments(xy1[,1],xy1[,2],xy2[,1], xy2[,2])
## End(Not run)




