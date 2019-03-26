library(spatstat)


### Name: with.msr
### Title: Evaluate Expression Involving Components of a Measure
### Aliases: with.msr
### Keywords: spatial manip

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   rp <- residuals(fit, type="pearson")

   with(rp, atoms)
   with(rp, qlocations %mark% continuous)



