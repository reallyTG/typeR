library(geoaxe)


### Name: chop
### Title: Split polygon into many
### Aliases: chop

### ** Examples

library("rgeos")
wkt <- "POLYGON((-180 -20, -140 55, 10 0, -140 -60, -180 -20))"

# SpatialPolygons input
poly <- readWKT(wkt)
plot(poly)
polys <- chop(x = poly)
to_wkt(polys)
to_wkt(polys)[[2]]
plot(polys)
plot(poly, add = TRUE, lwd = 6)

# SpatialPolygonsDataFrame input
class(poly)
polydf <- as(poly, "SpatialPolygonsDataFrame")
class(polydf)
chop(polydf)

# WKT character input
chop(wkt)

# geojson character input
file <- system.file("examples", "sample1.geojson", package = "geoaxe")
x <- readLines(file)
chop(x)

# geojson json input
x <- structure(x, class = "json")
chop(x)



