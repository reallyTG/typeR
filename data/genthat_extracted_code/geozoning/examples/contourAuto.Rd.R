library(geozoning)


### Name: contourAuto
### Title: contourAuto
### Aliases: contourAuto

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
plot(mapTest$boundary,type="l",col="red")
geozoning:::linesC(cL)
# not run



