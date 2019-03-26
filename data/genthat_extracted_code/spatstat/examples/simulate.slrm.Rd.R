library(spatstat)


### Name: simulate.slrm
### Title: Simulate a Fitted Spatial Logistic Regression Model
### Aliases: simulate.slrm
### Keywords: spatial models

### ** Examples

  X <- copper$SouthPoints
  fit <- slrm(X ~ 1)
  simulate(fit, 2)
  fitxy <- slrm(X ~ x+y)
  simulate(fitxy, 2, window=square(2))



