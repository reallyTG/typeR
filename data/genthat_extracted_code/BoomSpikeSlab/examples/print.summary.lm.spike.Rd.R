library(BoomSpikeSlab)


### Name: print.summary.lm.spike
### Title: Print method for spikeslab objects.
### Aliases: print.summary.lm.spike print.summary.logit.spike
### Keywords: models, regression

### ** Examples

  n <- 100
  p <- 10
  ngood <- 3
  niter <- 1000
  sigma <- 2

  x <- cbind(1, matrix(rnorm(n * (p-1)), nrow=n))
  beta <- c(rnorm(ngood), rep(0, p - ngood))
  y <- rnorm(n, x %*% beta, sigma)
  x <- x[,-1]
  model <- lm.spike(y ~ x, niter=niter)
  summary(model)



