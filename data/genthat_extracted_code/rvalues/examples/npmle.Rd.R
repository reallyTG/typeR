library(rvalues)


### Name: npmle
### Title: Maximum Likelihood Estimate of a Mixing Distribution.
### Aliases: npmle
### Keywords: nonparametric models

### ** Examples

## Not run: 
##D data(hiv)
##D npobj <- npmle(hiv, family = tdist(df=6), maxiter = 25)
##D 
##D 
##D ###  Generate Binomial data with Beta mixing distribution
##D n <- 3000
##D theta <- rbeta(n, shape1 = 2, shape2 = 10)
##D ntrials <- rpois(n, lambda = 10)
##D x <- rbinom(n, size = ntrials, prob = theta)
##D 
##D ###  Estimate mixing distribution 
##D dd <- cbind(x,ntrials)
##D npest <- npmle(dd, family = binomial, maxiter = 25)
##D 
##D ### compare with true mixture cdf
##D tt <- seq(1e-4,1 - 1e-4, by = .001)
##D plot(npest, lwd = 2)
##D lines(tt, pbeta(tt, shape1 = 2, shape2 = 10), lwd = 2, lty = 2)
## End(Not run)



