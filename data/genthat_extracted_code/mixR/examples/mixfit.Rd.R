library(mixR)


### Name: mixfit
### Title: Finite Mixture Modeling for Raw Data and Binned Data
### Aliases: mixfit

### ** Examples

## fitting the normal mixture models
set.seed(103)
x <- rmixnormal(200, c(0.3, 0.7), c(2, 5), c(1, 1))
data <- bin(x, seq(-1, 8, 0.25))
fit1 <- mixfit(x, ncomp = 2)  # raw data
fit2 <- mixfit(data, ncomp = 2)  # binned data
fit3 <- mixfit(x, pi = c(0.5, 0.5), mu = c(1, 4), sd = c(1, 1))  # providing the initial values
fit4 <- mixfit(x, ncomp = 2, ev = TRUE)  # setting the same variance

## (not run) fitting the weibull mixture models
## x <- rmixweibull(200, c(0.3, 0.7), c(2, 5), c(1, 1))
## data <- bin(x, seq(0, 8, 0.25))
## fit5 <- mixfit(x, ncomp = 2, family = "weibull")  # raw data
## fit6 <- mixfit(data, ncomp = 2, family = "weibull")  # binned data

## (not run) fitting the Gamma mixture models
## x <- rmixgamma(200, c(0.3, 0.7), c(2, 5), c(1, 1))
## data <- bin(x, seq(0, 8, 0.25))
## fit7 <- mixfit(x, ncomp = 2, family = "gamma")  # raw data
## fit8 <- mixfit(data, ncomp = 2, family = "gamma")  # binned data

## (not run) fitting the lognormal mixture models
## x <- rmixlnorm(200, c(0.3, 0.7), c(2, 5), c(1, 1))
## data <- bin(x, seq(0, 8, 0.25))
## fit9 <- mixfit(x, ncomp = 2, family = "lnorm")  # raw data
## fit10 <- mixfit(data, ncomp = 2, family = "lnorm")  # binned data




