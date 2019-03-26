library(rgeos)


### Name: gPointOnSurface
### Title: Point on Surface of Geometry
### Aliases: gPointOnSurface RGEOSPointOnSurface
### Keywords: spatial

### ** Examples

# Based on test geometries from JTS
g1 = readWKT(paste("MULTIPOINT (60 300, 200 200, 240 240, 200 300, 40 140,",
 "80 240, 140 240, 100 160, 140 200, 60 200)"))
g2 = readWKT("LINESTRING (0 0, 7 14)")
g3 = readWKT("LINESTRING (0 0, 3 15, 6 2, 11 14, 16 5, 16 18, 2 22)")
g4 = readWKT(paste("MULTILINESTRING ((60 240, 140 300, 180 200, 40 140, 100 100, 120 220),",
 "(240 80, 260 160, 200 240, 180 340, 280 340, 240 180, 180 140, 40 200, 140 260))"))
g5 = readWKT("POLYGON ((0 0, 0 10, 10 10, 10 0, 0 0))")
g6 = readWKT(paste("MULTIPOLYGON (((50 260, 240 340, 260 100, 20 60, 90 140, 50 260),",
 "(200 280, 140 240, 180 160, 240 140, 200 280)),",
 "((380 280, 300 260, 340 100, 440 80, 380 280),",
 "(380 220, 340 200, 400 100, 380 220)))"))

par(mfrow=c(2,3))
plot(g1); plot(gPointOnSurface(g1),col='red',add=TRUE)
plot(g2); plot(gPointOnSurface(g2),col='red',add=TRUE)
plot(g3); plot(gPointOnSurface(g3),col='red',add=TRUE)
plot(g4); plot(gPointOnSurface(g4),col='red',add=TRUE)
plot(g5); plot(gPointOnSurface(g5),col='red',add=TRUE)
plot(g6); plot(gPointOnSurface(g6),col='red',add=TRUE)



