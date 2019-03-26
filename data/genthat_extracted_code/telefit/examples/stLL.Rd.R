library(telefit)


### Name: stLL
### Title: Compute log likelihood for model
### Aliases: stLL

### ** Examples

library(dplyr)
library(foreach)
library(itertools)

set.seed(2018)

data("coprecip")
data("coprecip.fit")
attach(coprecip)

ests = coef(coprecip.fit, burn = 50)

ll = stLL(stData = coprecip, stFit = coprecip.fit, 
          beta = matrix(ests$beta, ncol = 2), 
          sigmasq_y = ests$sigmasq_y, sigmasq_r = ests$sigmasq_r, 
          sigmasq_eps = ests$sigmasq_eps,
          rho_y = ests$rho_y, rho_r = ests$rho_r, 
          sigmasq_r_eps = 0)



