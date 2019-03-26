library(waver)


### Name: fetch_len
### Title: Calculate the fetch length around a point
### Aliases: fetch_len

### ** Examples

 pt <- SpatialPoints(matrix(c(0, 0), ncol = 2),
                     proj4string = CRS("+proj=longlat"))
 # Shoreline is a rectangle from (-0.2, 0.25) to (0.3, 0.5)
 rect <- Polygon(cbind(c(rep(-0.2, 2), rep(0.3, 2), -0.2),
                       c(0.25, rep(0.3, 2), rep(0.25, 2))))
 land <- SpatialPolygons(list(Polygons(list(rect), ID = 1)),
                         proj4string = CRS("+proj=longlat"))
 fetch_len(pt, bearings = c(0, 45, 225, 315), land,
           dmax = 50000, spread = c(-10, 0, 10))



