library(clogitLasso)


### Name: clogitLasso
### Title: fit lasso for conditional logistic regression for matched
###   case-control studies
### Aliases: clogitLasso

### ** Examples

## Not run: 
##D # generate data
##D y <- rep(c(1,0), 100)
##D X <- matrix (rnorm(20000, 0, 1), ncol = 100) # pure noise
##D strata <- sort(rep(1:100, 2))
##D 
##D # 1:1
##D fitLasso <- clogitLasso(X,y,strata,log=TRUE)
## End(Not run)



