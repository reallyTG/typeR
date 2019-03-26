library(maptools)


### Name: unionSpatialPolygons
### Title: Aggregate Polygons in a SpatialPolygons object
### Aliases: unionSpatialPolygons
### Keywords: spatial

### ** Examples

if (rgeosStatus()) {
nc1 <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 proj4string=CRS("+proj=longlat +datum=NAD27"))
lps <- coordinates(nc1)
ID <- cut(lps[,1], quantile(lps[,1]), include.lowest=TRUE)
reg4 <- unionSpatialPolygons(nc1, ID)
row.names(reg4)
}



