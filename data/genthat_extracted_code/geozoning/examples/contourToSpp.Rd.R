library(geozoning)


### Name: contourToSpp
### Title: contourToSpp
### Aliases: contourToSpp

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
contourToSpp(cL[[8]],0.1)



