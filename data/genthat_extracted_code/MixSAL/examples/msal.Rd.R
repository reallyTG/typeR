library(MixSAL)


### Name: msal
### Title: Model-Based Clustering using a Mixture of SAL Distributions
### Aliases: msal
### Keywords: Mixtures of SAL Distributions EM Algorithm Model-Based
###   Clustering

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

## Clustering the Old Faithful Geyser Data
data(faithful)
msal.ex2 <- msal(x=faithful,G=2)
plot(x=faithful,col=msal.ex2$cluster)

## Clustering the Yeast Data
data(yeast)
msal.ex3 <- msal(x=yeast[,-1],G=2)
table(yeast[,1],msal.ex3$cluster)



