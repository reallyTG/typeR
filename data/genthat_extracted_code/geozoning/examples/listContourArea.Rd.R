library(geozoning)


### Name: listContourArea
### Title: listContourArea
### Aliases: listContourArea
### Keywords: internal

### ** Examples

data(mapTest)
cL=list()
cL=contourAuto(cL,mapTest$step,mapTest$xsize,mapTest$ysize,mapTest$krigGrid,c(5,7),mapTest$boundary)
geozoning:::listContourArea(cL)



