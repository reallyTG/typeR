library(spatstat)


### Name: effectfun
### Title: Compute Fitted Effect of a Spatial Covariate in a Point Process
###   Model
### Aliases: effectfun
### Keywords: spatial models

### ** Examples

  X <- copper$SouthPoints
  D <- distfun(copper$SouthLines)
  fit <- ppm(X ~ polynom(D, 5))
  effectfun(fit)
  plot(effectfun(fit, se.fit=TRUE))

  fitx <- ppm(X ~ x + polynom(D, 5))
  plot(effectfun(fitx, "D", x=20))



