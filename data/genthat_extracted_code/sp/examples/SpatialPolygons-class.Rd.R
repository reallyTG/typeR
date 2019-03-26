library(sp)


### Name: SpatialPolygons-class
### Title: Class "SpatialPolygons"
### Aliases: SpatialPolygons-class [,SpatialPolygons-method
###   as.data.frame.SpatialPolygons
###   as.SpatialPolygonsDataFrame.SpatialPolygons
###   coerce,SpatialPolygons,SpatialPolygonsDataFrame-method
###   plot,SpatialPolygons,missing-method summary,SpatialPolygons-method
###   rbind.SpatialPolygons coerce,Polygons,Lines-method
###   coerce,SpatialPolygons,SpatialLines-method
###   coerce,deldir,SpatialPolygons-method row.names.SpatialPolygons
###   get_Polypath set_Polypath get_PolypathRule set_PolypathRule
### Keywords: classes

### ** Examples

# simple example, from vignette("sp"):
Sr1 = Polygon(cbind(c(2,4,4,1,2),c(2,3,5,4,2)))
Sr2 = Polygon(cbind(c(5,4,2,5),c(2,3,2,2)))
Sr3 = Polygon(cbind(c(4,4,5,10,4),c(5,3,2,5,5)))
Sr4 = Polygon(cbind(c(5,6,6,5,5),c(4,4,3,3,4)), hole = TRUE)

Srs1 = Polygons(list(Sr1), "s1")
Srs2 = Polygons(list(Sr2), "s2")
Srs3 = Polygons(list(Sr3, Sr4), "s3/4")
SpP = SpatialPolygons(list(Srs1,Srs2,Srs3), 1:3)
plot(SpP, col = 1:3, pbg="white")

grd <- GridTopology(c(1,1), c(1,1), c(10,10))
polys <- as(grd, "SpatialPolygons")
plot(polys)
text(coordinates(polys), labels=row.names(polys))



