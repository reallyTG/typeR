library(FunChisq)


### Name: cp.chisq.test
### Title: Comparative Chi-Square Test for Association Heterogeneity
### Aliases: cp.chisq.test
### Keywords: htest nonparametric

### ** Examples

## Not run: 
##D x <- matrix(c(4,0,4,0,4,0,1,0,1), 3)
##D y <- t(x)
##D z <- matrix(c(1,0,1,4,0,4,0,4,0), 3)
##D data <- list(x,y,z)
##D cp.chisq.test(data)
##D cp.chisq.test(data, method="nchisq")
## End(Not run)



