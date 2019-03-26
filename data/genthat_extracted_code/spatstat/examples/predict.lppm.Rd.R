library(spatstat)


### Name: predict.lppm
### Title: Predict Point Process Model on Linear Network
### Aliases: predict.lppm
### Keywords: spatial models

### ** Examples

  X <- runiflpp(12, simplenet)
  fit <- lppm(X ~ x)
  v <- predict(fit, type="trend")
  plot(v)



