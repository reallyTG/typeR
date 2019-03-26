library(BoomSpikeSlab)


### Name: residuals.lm.spike
### Title: Extract lm.spike Residuals
### Aliases: residuals.lm.spike
### Keywords: models, regression

### ** Examples

  niter <- 1000
  n <- 100
  p <- 10
  ngood <- 3

  x <- cbind(1, matrix(rnorm(n * (p-1)), nrow=n))
  beta <- rep(0, p)
  good <- sample(1:p, ngood)
  beta[good] <- rnorm(ngood)
  sigma <- 1

  y <- rnorm(n, x %*% beta, sigma)
  model <- lm.spike(y ~ x - 1, niter=niter)
  plot(model)
  residuals(model)
  residuals(model, mean.only = TRUE)



