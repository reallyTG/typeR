library(LaplacesDemon)


### Name: dist.Normal.Mixture
### Title: Mixture of Normal Distributions
### Aliases: dnormm pnormm rnormm
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
p <- c(0.3,0.3,0.4)
mu <- c(-5, 1, 5)
sigma <- c(1,2,1)
x <- seq(from=-10, to=10, by=0.1)
plot(x, dnormm(x, p, mu, sigma, log=FALSE), type="l") #Density
plot(x, pnormm(x, p, mu, sigma), type="l") #CDF
plot(density(rnormm(10000, p, mu, sigma))) #Random Deviates



