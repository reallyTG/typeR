library(GaussianHMM1d)


### Name: GaussianMixtureInv
### Title: Inverse distribution function of a mixture of Gaussian
###   univariate distributions
### Aliases: GaussianMixtureInv

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); w <-c(0.8, 0.2);
p <- seq(0.01, 0.99, by = 0.01)
q <- GaussianMixtureInv(p,mu,sigma,w)
plot(p,q,type="l")




