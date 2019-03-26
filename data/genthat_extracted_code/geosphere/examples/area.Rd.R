library(geosphere)


### Name: areaPolygon
### Title: Area of a longitude/latitude polygon
### Aliases: areaPolygon areaPolygon,matrix-method
###   areaPolygon,data.frame-method areaPolygon,SpatialPolygons-method
### Keywords: spatial

### ** Examples

p <- rbind(c(-180,-20), c(-140,55), c(10, 0), c(-140,-60), c(-180,-20))
areaPolygon(p)

# Be careful with very large polygons, as they may not be what they seem!
# For example, if you wanted a polygon to compute the area equal to about 1/4 of the ellipsoid
# this won't work:
b <- matrix(c(-180, 0, 90, 90, 0, 0, -180, 0), ncol=2, byrow=TRUE)
areaPolygon(b)
# Becausee the shortest path between (-180,0) and (0,0) is 
# over one of the poles, not along the equator!
# Inserting a point along the equator fixes that
b <- matrix(c(-180, 0, 0, 0, -90,0, -180, 0), ncol=2, byrow=TRUE)
areaPolygon(b)




