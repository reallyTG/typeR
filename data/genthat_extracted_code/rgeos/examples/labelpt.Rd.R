library(rgeos)


### Encoding: UTF-8

### Name: polygonsLabel
### Title: Compute optimal label positions for polygons
### Aliases: polygonsLabel
### Keywords: spatial

### ** Examples

# Simple example with a single polygon
x = c(0, 1.8, 1.8, 1, 1, 3, 3, 2.2, 2.2, 4,
      4, 6, 6, 14, 14, 6, 6,  4, 4, 0, 0)
y = c(0, 0, -2, -2, -10, -10, -2, -2, 0, 0,
      1.8, 1.8, 1, 1, 3, 3, 2.2, 2.2, 4, 4, 0)
xy = data.frame(x,y)
library(sp)
xy.sp = SpatialPolygons(list(Polygons(list(Polygon(xy)), ID = "test")))
plot(xy.sp, col = "khaki")
polygonsLabel(xy.sp, "Hi!")


# Example with multiple polygons, text labels and colours
x1 = c(0, 4, 4, 0, 0)
y1 = c(0, 0, 4, 4, 0)
x2 = c(1, 1, 3, 3, 1)
y2 = c(-2, -10, -10, -2, -2)
x3 = c(6, 14, 14, 6, 6)
y3 = c(1, 1, 3, 3, 1)
xy.sp = SpatialPolygons(list(
  Polygons(list(Polygon(cbind(x1,y1))), ID = "test1"), # box
  Polygons(list(Polygon(cbind(x3,y3))), ID = "test3"), # wide
  Polygons(list(Polygon(cbind(x2,y2))), ID = "test2")  # high
))
plot(xy.sp, col=terrain.colors(3))
labels=c("Hi!", "A very long text string", "N\na\nr\nr\no\nw")

# Note that the label for the tall and narrow box is
# not necessarily centred vertically in the box.
# The reason is that method="maxdist" minimises the 
# maximum distance from the label box to the surrounding
# polygon, and this distance is not changed by moving
# the label vertically, as long the vertical distance
# to the polygon boundary is less than the horizontal
# distance. For regular polygons like this, the other
# label positions (e.g., method="buffer") work better.
polygonsLabel(xy.sp, labels, cex=.8,
              col = c('white', 'black', 'maroon'))


## Not run: 
##D ## Example showing how bad the centroid 
##D ## position can be on real maps.
##D 
##D # Needed libraries
##D if (require(maps) && require(maptools) && require(rgdal)) {
##D 
##D # Load map data and convert to spatial object
##D nmap = map("world", c("Norway", "Sweden", "Finland"),
##D            exact = TRUE, fill = TRUE, col = "transparent", plot = FALSE)
##D nmap.pol = map2SpatialPolygons(nmap, IDs = nmap$names,
##D                                proj4string = CRS("+init=epsg:4326"))
##D nmap.pol = spTransform(nmap.pol, CRS("+init=epsg:3035"))
##D 
##D # Plot map, centroid positions (red dots) and optimal
##D # label positions using the ‘buffer’ method.
##D plot(nmap.pol, col = "khaki")
##D nmap.centroids = polygonsLabel(nmap.pol, names(nmap.pol),
##D                                method = "centroid", doPlot = FALSE)
##D points(nmap.centroids, col = "red", pch=19)
##D polygonsLabel(nmap.pol, names(nmap.pol), method = "buffer", cex=.8)
##D }
## End(Not run)



