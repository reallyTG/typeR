library(geozoning)


### Name: plotListC
### Title: plotListC
### Aliases: plotListC

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
plot(mapTest$boundary,type="l")
plotListC(cL)



