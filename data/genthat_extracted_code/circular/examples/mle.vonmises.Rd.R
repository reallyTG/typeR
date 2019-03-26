library(circular)


### Name: mle.vonmises
### Title: von Mises Maximum Likelihood Estimates
### Aliases: mle.vonmises print.mle.vonmises
### Keywords: htest

### ** Examples

x <- rvonmises(n=50, mu=circular(0), kappa=5)
mle.vonmises(x) # estimation of mu and kappa
mle.vonmises(x, mu=circular(0)) # estimation of kappa only



