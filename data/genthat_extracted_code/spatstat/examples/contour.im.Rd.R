library(spatstat)


### Name: contour.im
### Title: Contour plot of pixel image
### Aliases: contour.im
### Keywords: spatial hplot

### ** Examples

   # an image
   Z <- setcov(owin())
   contour(Z, axes=TRUE)
   contour(Z)

   co <- colourmap(rainbow(100), range=c(0,1))
   contour(Z, col=co, lwd=2)



