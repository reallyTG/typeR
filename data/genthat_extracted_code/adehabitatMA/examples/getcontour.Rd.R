library(adehabitatMA)


### Name: getcontour
### Title: Computes the Contour Polygon of a Raster Object
### Aliases: getcontour
### Keywords: programming hplot

### ** Examples


data(meuse.grid)
a <- SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
                            data = meuse.grid)


## the contour of the map
gc <- getcontour(a[,1])
plot(gc)






