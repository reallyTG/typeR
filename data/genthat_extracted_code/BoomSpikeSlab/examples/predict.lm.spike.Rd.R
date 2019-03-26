library(BoomSpikeSlab)


### Name: predict.lm.spike
### Title: Predictions using spike-and-slab regression.
### Aliases: predict.lm.spike predict.logit.spike predict.probit.spike
###   predict.poisson.spike predict.qreg.spike
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
  plot.ts(model$beta)
  hist(model$sigma)  ## should be near true value

  new.x <- cbind(1, matrix(rnorm(100 * (p-1)), ncol = (p-1)))
  pred <- predict(model, newdata = new.x, burn = 100)



