library(GaussianHMM1d)


### Name: GaussianMixtureCdf
### Title: Distribution function of a mixture of Gaussian univariate
###   distributions
### Aliases: GaussianMixtureCdf

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); w <-c(0.8, 0.2);
x <- seq(-1, 1, by = 0.01)
F <- GaussianMixtureCdf(x,mu,sigma,w)
plot(x,F,type="l")




