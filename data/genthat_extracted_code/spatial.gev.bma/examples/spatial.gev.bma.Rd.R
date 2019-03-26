library(spatial.gev.bma)


### Name: spatial.gev.bma
### Title: Run an MCMC to fit a hierarchical spatial generalized extreme
###   value (GEV) model with the option for Bayesian model averaging (BMA)
### Aliases: spatial.gev.bma

### ** Examples

data(norway)
attach(norway)
##To replicate our results, change 2 to 2e5 below
a <- spatial.gev.bma(Y.list,X,S,2)  



