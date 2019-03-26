library(geoaxe)


### Name: to_wkt
### Title: To WKT
### Aliases: to_wkt

### ** Examples

library("rgeos")
wkt <- "POLYGON((-180 -20, -140 55, 10 0, -140 -60, -180 -20))"
poly <- readWKT(wkt)
polys <- chop(x = poly)
to_wkt(polys)
to_wkt(polys)[[2]]



