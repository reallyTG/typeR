library(spatstat)


### Name: Extract.msr
### Title: Extract Subset of Signed or Vector Measure
### Aliases: [.msr
### Keywords: spatial manip

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X ~x+y)
   rp <- residuals(fit, type="pearson")
   rs <- residuals(fit, type="score")

   rp[square(0.5)]
   rs[ , 2:3]



