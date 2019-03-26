library(mev)


### Name: lambdadep
### Title: Estimation of the bivariate lambda function of Wadsworth and
###   Tawn (2013)
### Aliases: lambdadep

### ** Examples

set.seed(12)
dat <- evd::rbvevd(n=1000, dep = 0.1)
lambdadep(dat, method = "hill")
## Not run: 
##D lambdadep(dat, method = "bayes")
##D lambdadep(dat, method = "mle")
##D dat <- matrix(runif(n = 2000), ncol = 2)
##D lambdadep(dat, method = "hill")
## End(Not run)



