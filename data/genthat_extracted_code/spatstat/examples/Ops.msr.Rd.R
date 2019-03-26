library(spatstat)


### Name: Ops.msr
### Title: Arithmetic Operations on Measures
### Aliases: Ops.msr
### Keywords: spatial methods

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   rp <- residuals(fit, type="pearson")
   rp

   -rp
   2 * rp
   rp /2

   rp - rp

   rr <- residuals(fit, type="raw")
   rp - rr



