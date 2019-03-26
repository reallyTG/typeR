library(mcmcplots)


### Name: mcmcplot1
### Title: MCMC Diagnostics Plots for one Model Parameter
### Aliases: mcmcplot1
### Keywords: hplot

### ** Examples

## Create fake MCMC output
fakemcmc <- coda::as.mcmc.list(coda::mcmc(sapply(1:5, function(dum) rnorm(1000))))
coda::varnames(fakemcmc) <- c("gamma[1,1]", "gamma[1,2]", "gamma[1,3]", "sigma[1]", "sigma[2]")

mcmcplot1(fakemcmc[, "sigma[1]", drop=FALSE])
mcmcplot1(fakemcmc[, "gamma[1,3]", drop=FALSE], style="plain")



