library(logitchoice)


### Name: coef.logitchoice
### Title: Return estimated coefficients from fitted logitchoice object.
### Aliases: coef.logitchoice
### Keywords: models choice logit

### ** Examples

  groupSizes = sample(6:18, 100, replace=TRUE)
  numGroups = length(groupSizes)
  n = sum(groupSizes)
  p = 10
  X = matrix(rnorm(n*p), nrow=n)
  X = scale(X)
  Y = rep(0, n)
  Y[cumsum(groupSizes)] = 1
  grouping = rep(1:numGroups, groupSizes)
  fit = logitchoice(X, Y, grouping)
max(abs(fit$betahat - coef(fit)))



