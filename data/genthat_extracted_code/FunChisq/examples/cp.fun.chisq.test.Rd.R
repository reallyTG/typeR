library(FunChisq)


### Name: cp.fun.chisq.test
### Title: Comparative Chi-Square Test for Non-Parametric Functional
###   Heterogeneity
### Aliases: cp.fun.chisq.test
### Keywords: htest nonparametric

### ** Examples

## Not run: 
##D x <- matrix(c(4,0,4,0,4,0,1,0,1), 3)
##D y <- t(x)
##D z <- matrix(c(1,0,1,4,0,4,0,4,0), 3)
##D data <- list(x,y,z)
##D cp.fun.chisq.test(data)
##D cp.fun.chisq.test(data, method="nfchisq")
## End(Not run)



