library(MCMCglmm)


### Name: posterior.mode
### Title: Estimates the marginal parameter modes using kernel density
###   estimation
### Aliases: posterior.mode
### Keywords: distribution

### ** Examples

v<-rIW(as.matrix(1),10, n=1000)
hist(v)
abline(v=posterior.mode(mcmc(v)), col="red")



