library(spatstat)


### Name: measureContinuous
### Title: Discrete and Continuous Components of a Measure
### Aliases: measureContinuous measureDiscrete
### Keywords: spatial math

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   rp <- residuals(fit, type="pearson")

   rp
   measureDiscrete(rp)
   measureContinuous(rp)



