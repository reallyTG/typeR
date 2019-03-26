library(adehabitatMA)


### Name: calcperimeter
### Title: Compute Perimeters of Objects of Class
###   "SpatialPolygonsDataFrame" and "PolyLinesDataFrame"
### Aliases: calcperimeter
### Keywords: hplot

### ** Examples

data(meuse.grid)
a <- SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
                            data = meuse.grid)


## the contour of the map
gc <- getcontour(a[,1])
plot(gc)

## Transforms the SpatialPolygons into SpatialPolygonsDataFrame
gc <- SpatialPolygonsDataFrame(gc, data.frame(x=1))

## The perimeter of this map (in units of the data):
ii <- calcperimeter(gc)
as.data.frame(ii)






