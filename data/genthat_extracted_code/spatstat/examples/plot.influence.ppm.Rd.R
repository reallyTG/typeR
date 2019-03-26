library(spatstat)


### Name: plot.influence.ppm
### Title: Plot Influence Measure
### Aliases: plot.influence.ppm
### Keywords: spatial models

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   plot(influence(fit))



