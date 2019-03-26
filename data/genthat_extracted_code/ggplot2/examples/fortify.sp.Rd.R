library(ggplot2)


### Name: fortify.sp
### Title: Fortify method for classes from the sp package.
### Aliases: fortify.sp fortify.SpatialPolygonsDataFrame
###   fortify.SpatialPolygons fortify.Polygons fortify.Polygon
###   fortify.SpatialLinesDataFrame fortify.Lines fortify.Line
### Keywords: internal

### ** Examples

if (require("maptools")) {
 sids <- system.file("shapes/sids.shp", package="maptools")
 nc1 <- readShapePoly(sids,
   proj4string = CRS("+proj=longlat +datum=NAD27"))
 nc1_df <- fortify(nc1)
}



