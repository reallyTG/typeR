library(spatstat)


### Name: Kscaled
### Title: Locally Scaled K-function
### Aliases: Kscaled Lscaled
### Keywords: spatial nonparametric

### ** Examples

  data(bronzefilter)
  X <- unmark(bronzefilter)
  K <- Kscaled(X)
  fit <- ppm(X, ~x)
  lam <- predict(fit)
  K <- Kscaled(X, lam)



