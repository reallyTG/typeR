library(spatstat)


### Name: plot.leverage.ppm
### Title: Plot Leverage Function
### Aliases: plot.leverage.ppm contour.leverage.ppm persp.leverage.ppm
### Keywords: spatial models

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X ~x+y)
   lef <- leverage(fit)
   plot(lef)
   contour(lef)
   persp(lef)



