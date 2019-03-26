library(spatstat)


### Name: msr
### Title: Signed or Vector-Valued Measure
### Aliases: msr
### Keywords: spatial models

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   
   rp <- residuals(fit, type="pearson")
   rp

   rs <- residuals(fit, type="score")
   rs
   colnames(rs)

   # An equivalent way to construct the Pearson residual measure by hand
   Q <- quad.ppm(fit)
   lambda <- fitted(fit)
   slam <- sqrt(lambda)
   Z <- is.data(Q)
   m <- msr(Q, discrete=1/slam[Z], density = -slam)
   m



