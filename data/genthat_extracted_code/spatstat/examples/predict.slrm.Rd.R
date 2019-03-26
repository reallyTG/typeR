library(spatstat)


### Name: predict.slrm
### Title: Predicted or Fitted Values from Spatial Logistic Regression
### Aliases: predict.slrm
### Keywords: spatial models methods

### ** Examples

  X <- rpoispp(42)
  fit <- slrm(X ~ x+y)
  plot(predict(fit))

  data(copper)
  X <- copper$SouthPoints
  Y <- copper$SouthLines
  Z <- distmap(Y)
  fitc <- slrm(X ~ Z)
  pc <- predict(fitc)

  Znew <- distmap(copper$Lines)[copper$SouthWindow]
  pcnew <- predict(fitc, newdata=list(Z=Znew))



