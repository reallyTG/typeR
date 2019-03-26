library(spatstat)


### Name: measureVariation
### Title: Positive and Negative Parts, and Variation, of a Measure
### Aliases: measureVariation measurePositive measureNegative
###   totalVariation
### Keywords: spatial math

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   rp <- residuals(fit, type="pearson")

   measurePositive(rp)
   measureNegative(rp)
   measureVariation(rp)

   # total variation norm
   totalVariation(rp)



