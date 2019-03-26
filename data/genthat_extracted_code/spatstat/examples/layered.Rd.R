library(spatstat)


### Name: layered
### Title: Create List of Plotting Layers
### Aliases: layered
### Keywords: spatial hplot

### ** Examples

   D <- distmap(cells)
   L <- layered(D, cells)
   L
   L <- layered(D, cells,
    plotargs=list(list(ribbon=FALSE), list(pch=16)))
   plot(L)

   layerplotargs(L)[[1]] <- list(.plot="contour")
   plot(L)



