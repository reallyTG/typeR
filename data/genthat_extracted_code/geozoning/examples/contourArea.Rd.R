library(geozoning)


### Name: contourArea
### Title: contourArea
### Aliases: contourArea

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
contourArea(cL[[8]])



