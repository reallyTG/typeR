library(lmom)


### Name: lmrp
### Title: L-moments of a general probability distribution
### Aliases: lmrp lmrq
### Keywords: distribution

### ** Examples

## Generalized extreme-value (GEV) distribution
## - three ways to get its L-moments
lmrp(cdfgev, c(2,3,-0.2))
lmrq(quagev, c(2,3,-0.2))
lmrgev(c(2,3,-0.2), nmom=4)

## GEV bounds specified as a vector
lmrp(cdfgev, c(2,3,-0.2), bounds=c(-13,Inf))

## GEV bounds specified as a function -- single vector of parameters
gevbounds <- function(para) {
  k <- para[3]
  b <- para[1]+para[2]/k
  c(ifelse(k<0, b, -Inf), ifelse(k>0, b, Inf))
}
lmrp(cdfgev, c(2,3,-0.2), bounds=gevbounds)

## GEV bounds specified as a function -- separate parameters
pgev <- function(x, xi, alpha, k)
  pmin(1, pmax(0, exp(-((1-k*(x-xi)/alpha)^(1/k)))))
pgevbounds <- function(xi,alpha,k) {
  b <- xi+alpha/k
  c(ifelse(k<0, b, -Inf), ifelse(k>0, b, Inf))
}
lmrp(pgev, xi=2, alpha=3, k=-0.2, bounds=pgevbounds)

## Normal distribution
lmrp(pnorm)
lmrp(pnorm, symm=0)
lmrp(pnorm, mean=2, sd=3, symm=2)
# For comparison, the exact values
lmrnor(c(2,3), nmom=4)

# Many L-moment ratios of the exponential distribution
# This may warn that "the integral is probably divergent"
lmrq(qexp, order=3:20)

# ... nonetheless the computed values seem accurate:
# compare with the exact values, tau_r = 2/(r*(r-1)):
cbind(exact=2/(3:20)/(2:19), lmrq(qexp, order=3:20, verbose=TRUE))

# Of course, sometimes the integral really is divergent
## Not run: 
##D lmrq(function(p) (1-p)^(-1.5))
## End(Not run)

# And sometimes the integral is divergent but that's not what
# the warning says (at least on the author's system)
lmrp(pcauchy)

# Trimmed L-moments for Cauchy distribution are finite
lmrp(pcauchy, symm=0, trim=1)

# Works for discrete distributions too, but often requires
# a larger-than-default value of 'subdiv'
lmrp(ppois, lambda=5, subdiv=1000)



