library(spatstat)


### Name: Smooth.fv
### Title: Apply Smoothing to Function Values
### Aliases: Smooth.fv
### Keywords: spatial nonparametric

### ** Examples

   data(cells)
   G <- Gest(cells)
   plot(G)
   plot(Smooth(G, df=9), add=TRUE)



