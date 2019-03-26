library(BoomSpikeSlab)


### Name: summary.logit.spike
### Title: Numerical summaries of the results from a spike and slab
###   logistic regression.
### Aliases: summary.logit.spike summary.probit.spike
### Keywords: models, regression

### ** Examples

  n <- 100
  p <- 10
  ngood <- 3
  niter <- 1000

  x <- cbind(1, matrix(rnorm(n * (p-1)), nrow=n))
  beta <- c(rnorm(ngood), rep(0, p - ngood))
  prob <- plogis(x %*% beta)
  y <- runif(n) < prob
  x <- x[,-1]
  model <- logit.spike(y ~ x, niter=niter)
  summary(model)



