library(spatstat)


### Name: leverage.ppm
### Title: Leverage Measure for Spatial Point Process Model
### Aliases: leverage leverage.ppm
### Keywords: spatial models

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X ~x+y)
   plot(le <- leverage(fit))
   mean(le)



