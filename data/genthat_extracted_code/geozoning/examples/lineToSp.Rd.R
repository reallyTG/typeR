library(geozoning)


### Name: lineToSp
### Title: lineToSp
### Aliases: lineToSp
### Keywords: internal

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
lin=data.frame(x=cL[[8]]$x,y=cL[[8]]$y)
sp=geozoning:::lineToSp(lin)



