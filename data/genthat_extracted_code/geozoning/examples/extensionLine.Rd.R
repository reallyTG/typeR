library(geozoning)


### Name: extensionLine
### Title: extensionLine
### Aliases: extensionLine
### Keywords: internal

### ** Examples

data(mapTest)
step=mapTest$step
xsize=mapTest$xsize
ysize=mapTest$ysize
cL=contourLines(seq(step, xsize-step, by=step),seq(step, ysize-step, by=step),
               mapTest$krigGrid, levels = c(5,7))
plot(mapTest$boundary,type="l",col="red")
lines(cL[[1]])#contour line is not closed
lines(geozoning:::extensionLine(cL[[1]],step,sp::SpatialPoints(mapTest$boundary),
     geozoning:::superLines(mapTest$boundary)),col="red") #contour line is closed



