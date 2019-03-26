library(geozoning)


### Name: checkContour
### Title: checkContour
### Aliases: checkContour

### ** Examples

data(mapTest)
cL=contourAuto(list(),mapTest$step,mapTest$xsize,mapTest$ysize,
   mapTest$krigGrid,c(5,7),mapTest$boundary)
pG=polyToSp2(sp::Polygon(mapTest$boundary)) #SpatialPolygons corresponding to map boundary
rgeos::plot(pG)
sp8 = contourToSpp(cL[[8]],0.1)$sp
refPoint = rgeos::gCentroid(sp8)
resp=checkContour(sp8,mapTest$step,refPoint)
rgeos::plot(resp$contourSp,col="red",add=TRUE)



