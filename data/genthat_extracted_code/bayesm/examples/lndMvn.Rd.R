library(bayesm)


### Name: lndMvn
### Title: Compute Log of Multivariate Normal Density
### Aliases: lndMvn
### Keywords: distribution

### ** Examples

Sigma = matrix(c(1, 0.5, 0.5, 1), ncol=2)
lndMvn(x=c(rep(0,2)), mu=c(rep(0,2)), rooti=backsolve(chol(Sigma),diag(2)))



