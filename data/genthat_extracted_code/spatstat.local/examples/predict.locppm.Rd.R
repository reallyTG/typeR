library(spatstat.local)


### Name: predict.locppm
### Title: Prediction of a Locally Fitted Poisson or Gibbs Point Process
###   Model
### Aliases: predict.locppm fitted.locppm
### Keywords: spatial models

### ** Examples

  fit <- locppm(cells, sigma=0.1, use.fft=TRUE)
  lam <- predict(fit)



