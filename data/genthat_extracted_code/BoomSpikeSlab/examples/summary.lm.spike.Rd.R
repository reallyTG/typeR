library(BoomSpikeSlab)


### Name: summary.lm.spike
### Title: Numerical summaries of the results from a spike and slab
###   regression.
### Aliases: summary.lm.spike
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
  plot(model)
  plot.ts(model$beta)
  hist(model$sigma)  ## should be near 8
  summary(model)



