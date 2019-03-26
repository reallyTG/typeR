library(bayesm)


### Name: rmvst
### Title: Draw from Multivariate Student-t
### Aliases: rmvst
### Keywords: multivariate distribution

### ** Examples

set.seed(66)
rmvst(nu=5, mu=c(rep(0,2)), root=chol(matrix(c(2,1,1,2), ncol=2)))



