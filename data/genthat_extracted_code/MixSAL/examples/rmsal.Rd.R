library(MixSAL)


### Name: rmsal
### Title: Simulate from a Mixture of Multivariate SAL Distributions
### Aliases: rmsal
### Keywords: Simulation Mixtures of SAL Distributions

### ** Examples

alpha <- matrix(c(2,2,1,2),2,2)
sig <- array(NA,dim=c(2,2,2))
sig[,,1] <- diag(2)
sig[,,2] <- matrix(c(1,0.5,0.5,1),2,2)
mu <- matrix(c(0,0,-2,5),2,2)
pi.g <- rep(1/2,2)
x <- rmsal(n=500,p=2,alpha=alpha,sig=sig,mu=mu,pi.g=pi.g)
plot(x[,-1],col=x[,1],pch=x[,1])



