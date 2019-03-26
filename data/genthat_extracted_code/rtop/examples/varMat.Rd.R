library(rtop)


### Name: varMat
### Title: create a semivariogram matrix between a set of locations, or
###   semivariogram matrices between and within two sets of locations
### Aliases: varMat varMat.rtop varMat.SpatialPolygonsDataFrame
###   varMat.SpatialPolygons varMat.matrix varMat.list
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D rpath = system.file("extdata",package="rtop")
##D observations = readOGR(rpath,"observations")
##D vmod = list(model = "Ex1", params = c(0.00001,0.007,350000,0.9,1000))
##D vm = varMat(observations, variogramModel = vmod)
## End(Not run)



