library(GaussianHMM1d)


### Name: GaussianMixturePdf
### Title: Density function of a mixture of Gaussian univariate
###   distributions
### Aliases: GaussianMixturePdf

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); w <-c(0.8, 0.2);
x <- seq(-1, 1, by = 0.01)
f <- GaussianMixturePdf(x,mu,sigma,w)
plot(x,f,type="l")




