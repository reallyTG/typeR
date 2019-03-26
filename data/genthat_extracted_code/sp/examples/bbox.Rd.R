library(sp)


### Name: bbox-methods
### Title: retrieve bbox from spatial data
### Aliases: bbox,Spatial-method bbox,ANY-method bbox,Line-method
###   bbox,Lines-method bbox,Polygon-method bbox,Polygons-method bbox
### Keywords: methods spatial

### ** Examples

# just 9 points on a grid:
x <- c(1,1,1,2,2,2,3,3,3)
y <- c(1,2,3,1,2,3,1,2,3)
xy <- cbind(x,y)
S <- SpatialPoints(xy)
bbox(S)

# data.frame
data(meuse.grid)
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
bbox(meuse.grid)




