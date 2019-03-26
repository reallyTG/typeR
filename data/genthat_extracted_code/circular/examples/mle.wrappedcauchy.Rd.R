library(circular)


### Name: mle.wrappedcauchy
### Title: Wrapped Cauchy Maximum Likelihood Estimates
### Aliases: mle.wrappedcauchy print.mle.wrappedcauchy
### Keywords: htest

### ** Examples

x <- rwrappedcauchy(n=50, mu=circular(0), rho=0.5)
mle.wrappedcauchy(x) # estimation of mu and rho
mle.wrappedcauchy(x, mu=circular(0)) # estimation of rho only



