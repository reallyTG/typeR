library(MHadaptive)


### Name: mcmc_thin
### Title: Thin an MCMC object to reduce autocorrelation.
### Aliases: mcmc_thin

### ** Examples

data(mcmc_r)
## Thin the results of a simple Bayesian linear regression
mcmc_rTHINNED<-mcmc_thin(mcmc_r) 
plotMH(mcmc_rTHINNED)



