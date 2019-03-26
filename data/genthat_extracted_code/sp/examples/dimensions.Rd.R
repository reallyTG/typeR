library(sp)


### Name: dimensions-methods
### Title: retrieve spatial dimensions from spatial data
### Aliases: dimensions,Spatial-method dimensions
### Keywords: methods methods

### ** Examples

# just 9 points on a grid:
x <- c(1,1,1,2,2,2,3,3,3)
y <- c(1,2,3,1,2,3,1,2,3)
xy <- cbind(x,y)
S <- SpatialPoints(xy)
dimensions(S)

# data.frame
data(meuse.grid)
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
dimensions(meuse.grid)




