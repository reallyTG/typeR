library(ramps)


### Name: param
### Title: Initialization of georamps Model Parameters
### Aliases: param
### Keywords: models

### ** Examples

## Initial values for a flat prior
param(rep(0, 2), "flat")

## Random generation of initial values for an inverse-gamma prior
param(rep(NA, 2), "invgamma", shape = 2.0, scale = 0.1)

## Independent normal priors
param(rep(0, 2), "normal", mean = c(0, 0), variance = c(100, 100))

## Correlated normal priors
npv <- rbind(c(100, 25), c(25, 100))
param(rep(0, 2), "normal", mean = c(0, 0), variance = npv)

## Uniform prior and MCMC tuning parameter specification
param(10, "uniform", min = 0, max = 100, tuning = 0.5)



