library(MixSAL)


### Name: dmsal
### Title: Probability Density Function for a Mixture of SAL Distributions
### Aliases: dmsal
### Keywords: Probability Density Function Mixtures of SAL Distributions

### ** Examples

## For this illustration, consider the following dataset generated from a mixture of bivariate SAL
##distributions with the specified parameter set:
alpha <- matrix(c(2,2,1,2),2,2)
sig <- array(NA,dim=c(2,2,2))
sig[,,1] <- diag(2)
sig[,,2] <- matrix(c(1,0.5,0.5,1),2,2)
mu <- matrix(c(0,0,-2,5),2,2)
pi.g <- rep(1/2,2)
x <- rmsal(n=10,p=2,alpha=alpha,sig=sig,mu=mu,pi.g=pi.g)
## The value of the probability density function for each of the simulated values are given by:
dmsal(x=x[,-1],alpha=alpha,sig=sig,mu=mu,pi.g=pi.g)



