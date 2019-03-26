library(MCMCglmm)


### Name: posterior.ante
### Title: Posterior distribution of ante-dependence parameters
### Aliases: posterior.ante
### Keywords: distribution

### ** Examples

v<-rIW(diag(2),10, n=1000)
plot(posterior.ante(mcmc(v),1))



