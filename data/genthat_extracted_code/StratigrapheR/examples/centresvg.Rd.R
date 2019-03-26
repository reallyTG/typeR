library(StratigrapheR)


### Name: centresvg
### Title: Draws a pointsvg object around a given point
### Aliases: centresvg centersvg

### ** Examples

object <- example.ammonite

plot(c(-10,10), c(-10,10), type = "n")

centresvg(object, 5, 5, xfac = 2, yfac = 2,lty = 1,density = 20, angle = 45)

points(5,5,pch = 19, col = "blue")




