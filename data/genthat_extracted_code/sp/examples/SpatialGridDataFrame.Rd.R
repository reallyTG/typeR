library(sp)


### Name: SpatialPixelsDataFrame
### Title: define spatial grid with attribute data
### Aliases: SpatialPixelsDataFrame SpatialGridDataFrame
### Keywords: spatial

### ** Examples

data(meuse.grid)
m = SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")], data = meuse.grid)
class(m)
summary(m)



