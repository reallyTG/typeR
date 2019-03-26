library(MixSAL)


### Name: MixSAL-package
### Title: Mixtures of SAL Distributions
### Aliases: MixSAL-package MixSAL
### Keywords: Model-Based Clustering Finite Mixture Models Shifted
###   Asymmetric Laplace Distributions

### ** Examples

## Clustering Simulated Data
alpha <- matrix(c(2,2,1,2),2,2)
sig <- array(NA,dim=c(2,2,2))
sig[,,1] <- diag(2)
sig[,,2] <- matrix(c(1,0.5,0.5,1),2,2)
mu <- matrix(c(0,0,-2,5),2,2)
pi.g <- rep(1/2,2)
x <- rmsal(n=500,p=2,alpha=alpha,sig=sig,mu=mu,pi.g=pi.g)

msal.ex1 <- msal(x=x[,-1],G=2)
table(x[,1],msal.ex1$cluster)

## Evaluate the probability density function of the specified mixture of SAL distributions
pdf.sal <- dmsal(x=x[,-1],alpha=alpha,sig=sig,mu=mu,pi.g=pi.g)
pdf.sal[1:10]



