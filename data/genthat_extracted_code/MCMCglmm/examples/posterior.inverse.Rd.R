library(MCMCglmm)


### Name: posterior.inverse
### Title: Posterior distribution of matrix inverse
### Aliases: posterior.inverse
### Keywords: distribution

### ** Examples

v<-rIW(diag(2),3, n=1000)
plot(posterior.inverse(mcmc(v)))



