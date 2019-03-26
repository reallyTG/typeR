library(sp)


### Name: GridTopology-class
### Title: Class "GridTopology"
### Aliases: GridTopology-class print.summary.GridTopology
###   summary,GridTopology-method show,GridTopology-method
###   show,summary.GridTopology-method
###   coerce,GridTopology,data.frame-method
###   coerce,SpatialGrid,GridTopology-method
###   coerce,SpatialPixels,GridTopology-method
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



