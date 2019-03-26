library(BaPreStoPro)


### Name: NHPP-class
### Title: S4 class of model informations for non-homogeneous Poisson
###   process
### Aliases: NHPP-class

### ** Examples

parameter <- list(xi = c(2, 0.2))
Lambda <- function(t, xi) (t / xi[2])^xi[1]
priorDensity <- function(xi) dgamma(xi, c(2, 0.2), 1)
start <- parameter
model <- set.to.class("NHPP", parameter, start = start, Lambda = Lambda,
   priorDensity = priorDensity)



