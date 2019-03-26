library(GaussianHMM1d)


### Name: ForecastHMMeta
### Title: Estimated probabilities of the regimes given new observations
### Aliases: ForecastHMMeta

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2); eta <- c(.1,.9);
x <- c(0.2,-0.1,0.73)
out <- ForecastHMMeta(x,mu,sigma,Q,eta)




