library(sp)


### Name: SpatialGrid-class
### Title: Class "SpatialGrid"
### Aliases: SpatialGrid-class [,SpatialGrid-method
###   print.summary.SpatialGrid as.data.frame.SpatialGrid
###   summary,SpatialGrid-method coerce,SpatialGrid,data.frame-method
###   coerce,SpatialGrid,SpatialPixels-method
###   coerce,SpatialGrid,SpatialPoints-method
###   coerce,SpatialGrid,SpatialPolygons-method show,SpatialGrid-method
###   plot,SpatialGrid,missing-method coordnames,SpatialGrid-method
### Keywords: classes

### ** Examples

x = GridTopology(c(0,0), c(1,1), c(5,5))
class(x)
x
summary(x)
coordinates(x)
y = SpatialGrid(grid = x)
class(y)
y



