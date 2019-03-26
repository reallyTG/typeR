library(gaussDiff)


### Name: normdiff
### Title: Difference measures for multivariate Gaussian pdfs
### Aliases: normdiff normdiff.maha normdiff.KL normdiff.J normdiff.Chisq
###   normdiff.Hellinger normdiff.L2 maha tt print.normdiff
### Keywords: distribution multivariate cluster

### ** Examples

library(gaussDiff)
mu1 <- c(0,0,0)
sig1 <- diag(c(1,1,1))
mu2 <- c(1,1,1)
sig2 <- diag(c(0.5,0.5,0.5))

## Euclidean distance
normdiff(mu1=mu1,mu2=mu2,method="Euclidean")

## Mahalanobis distance
normdiff(mu1=mu1,sigma1=sig1,mu2=mu2,method="Mahalanobis")

## Kullback-Leibler divergence
normdiff(mu1=mu1,sigma1=sig1,mu2=mu2,sigma2=sig2,method="KL")

## J-Coefficient
normdiff(mu1=mu1,sigma1=sig1,mu2=mu2,sigma2=sig2,method="J")

## Chi-sqr divergence
normdiff(mu1=mu1,sigma1=sig1,mu2=mu2,sigma2=sig2,method="Chisq")

## Minkowsi L2 distance
normdiff(mu1=mu1,sigma1=sig1,mu2=mu2,sigma2=sig2,method="L2")

## Hellinger coefficient
normdiff(mu1=mu1,sigma1=sig1,mu2=mu2,sigma2=sig2,method="Hellinger")



