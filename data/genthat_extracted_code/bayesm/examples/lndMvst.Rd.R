library(bayesm)


### Name: lndMvst
### Title: Compute Log of Multivariate Student-t Density
### Aliases: lndMvst
### Keywords: distribution

### ** Examples

Sigma = matrix(c(1, 0.5, 0.5, 1), ncol=2)
lndMvst(x=c(rep(0,2)), nu=4,mu=c(rep(0,2)), rooti=backsolve(chol(Sigma),diag(2)))



