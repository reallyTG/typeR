library(mc2d)


### Name: rtrunc
### Title: Random Truncated Distributions
### Aliases: rtrunc
### Keywords: distribution

### ** Examples

rtrunc("rnorm", n=10, linf=0)
range(rtrunc(rnorm, n=1000, linf=3, lsup=5, sd=10))
## Discrete distributions
range(rtrunc(rpois, 1000, linf=2, lsup=4, lambda=1))
##Examples of rounding problems. 
##The first one will provide a warning while the results are unexpected, 
##The second will provide an error.
## Not run: 
##D table(rtrunc(rbinom, n=1000, size=10, prob=1-1E-20, lsup=9))
##D table(rtrunc(rbinom, n=1000, size=10, prob=1E-14, linf=0))
## End(Not run)



