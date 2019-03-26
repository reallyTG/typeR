library(MCMCglmm)


### Name: posterior.evals
### Title: Posterior distribution of eigenvalues
### Aliases: posterior.evals
### Keywords: distribution

### ** Examples

v<-rIW(diag(2),3, n=1000)
hist(posterior.evals(mcmc(v))[,2])



