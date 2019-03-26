library(spatstat)


### Name: plot.layered
### Title: Layered Plot
### Aliases: plot.layered
### Keywords: spatial hplot

### ** Examples

   data(cells)
   D <- distmap(cells)
   L <- layered(D, cells)
   plot(L)
   plot(L, which = 2)
   plot(L, plotargs=list(list(ribbon=FALSE), list(pch=3, cols="white")))
   # plot a subregion
   plot(L[, square(0.5)])



