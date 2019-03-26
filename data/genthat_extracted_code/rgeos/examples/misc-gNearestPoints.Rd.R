library(rgeos)


### Name: gNearestPoints
### Title: Closest Points of two Geometries
### Aliases: gNearestPoints
### Keywords: spatial

### ** Examples

if (version_GEOS0() > "3.4.0") {
g1 <- readWKT("MULTILINESTRING((34 54, 60 34), (0 10, 50 10, 100 50))")
g2 <- readWKT("MULTIPOINT(30 0, 100 30)")
plot(g1, pch=4, axes=TRUE)
plot(g2, add=TRUE)
plot(gNearestPoints(g1, g2), add=TRUE, col="red", pch=7)
gDistance(g1, g2)
}



