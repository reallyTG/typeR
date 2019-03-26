library(geozoning)


### Name: linesC
### Title: linesC
### Aliases: linesC
### Keywords: internal

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
plot(mapTest$boundary)
geozoning:::linesC(cL,col="black")



