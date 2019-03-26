library(glmmTMB)


### Name: get_cor
### Title: translate vector of correlation parameters to correlation
###   values, following the definition at <URL:
###   http://kaskr.github.io/adcomp/classUNSTRUCTURED__CORR__t.html>: if L
###   is the lower-triangular matrix with 1 on the diagonal and the
###   correlation parameters in the lower triangle, then the correlation
###   matrix is defined as Sigma = sqrt(D) L L' sqrt(D), where D = diag(L
###   L'). For a single correlation parameter theta0, this works out to rho
###   = theta0/sqrt(1+theta0^2).
### Aliases: get_cor

### ** Examples

th0 <- 0.5
stopifnot(all.equal(get_cor(th0),th0/sqrt(1+th0^2)))
get_cor(c(0.5,0.2,0.5))



