library(spatstat)


### Name: Smooth.msr
### Title: Smooth a Signed or Vector-Valued Measure
### Aliases: Smooth.msr
### Keywords: spatial models

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   rp <- residuals(fit, type="pearson")
   rs <- residuals(fit, type="score")

   plot(Smooth(rp))
   plot(Smooth(rs))



