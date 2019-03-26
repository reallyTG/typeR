library(BTYDplus)


### Name: mcmc.setBurnin
### Title: (Re-)set burnin of MCMC chains.
### Aliases: mcmc.setBurnin

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog)
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
param.draws.stable <- mcmc.setBurnin(param.draws, burnin = 200)



