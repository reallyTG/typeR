library(spatstat.local)


### Name: predict.loccit
### Title: Prediction for Locally-Fitted Cox or Cluster Model
### Aliases: predict.loccit fitted.loccit
### Keywords: spatial models methods

### ** Examples

  X <- redwood[owin(c(0,1), c(-1,-1/2))]
  fit <- loccit(X, ~1, "Thomas", nd=5, control=list(maxit=20))
  lam <- predict(fit)



