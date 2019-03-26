library(RegressionFactory)


### Name: regfac.merge
### Title: Utility Function for Adding Two Functions and Their Derivatives
### Aliases: regfac.merge

### ** Examples

# constructing the log-posterior for Bayesian logistic regression
# log-likelihood
loglike.logistic <- function(beta, X, y, fgh) {
  regfac.expand.1par(beta, X, y, fbase1.binomial.logit, fgh, n=1)
}
# log-prior
logprior.logistic <- function(beta, mu.beta, sd.beta, fgh) {
  f <- sum(dnorm(beta, mu.beta, sd.beta, log=TRUE))
  if (fgh==0) return (f)
  g <- -(beta-mu.beta)/sd.beta^2
  if (fgh==1) return (list(f=f, g=g))
  #h <- diag(rep(-1/sd.beta^2,length(beta)))
  h <- diag(-1/sd.beta^2)
  return (list(f=f, g=g, h=h))
}
# adding log-likelihood and log-prior according to Bayes rule
logpost.logistic <- function(beta, X, y, mu.beta, sd.beta, fgh) {
  ret.loglike <- loglike.logistic(beta, X, y, fgh)
  ret.logprior <- logprior.logistic(beta, mu.beta, sd.beta, fgh)
  regfac.merge(ret.loglike,ret.logprior, fgh=fgh)
}




