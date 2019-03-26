library(MCMCglmm)


### Name: posterior.cor
### Title: Transforms posterior distribution of covariances into
###   correlations
### Aliases: posterior.cor
### Keywords: distribution

### ** Examples

v<-rIW(diag(2),3, n=1000)
hist(posterior.cor(mcmc(v))[,2])



