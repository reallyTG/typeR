library(geozoning)


### Name: separationPoly
### Title: separationPoly
### Aliases: separationPoly
### Keywords: internal

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
plot(mapTest$boundary,type="l",col="red")
graphics::lines(cL[[8]])
pG=polyToSp2(sp::Polygon(mapTest$boundary)) # transform boundary into SpatialPolygons objects
cLSp=maptools::ContourLines2SLDF(list(cL[[8]])) # transform contour line into SpatialLines objects
polyBuff=rgeos::gBuffer(cLSp,width=0.00001) # extend geometry
polyDiff=rgeos::gDifference(pG,polyBuff)
recupPoly=geozoning:::separationPoly(polyDiff)
Z1=list(recupPoly[[1]],recupPoly[[2]])
plotZ(Z1)



