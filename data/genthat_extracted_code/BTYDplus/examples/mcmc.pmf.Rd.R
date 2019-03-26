library(BTYDplus)


### Name: mcmc.pmf
### Title: Probability Mass Function for Pareto/GGG, Pareto/NBD (HB) and
###   Pareto/NBD (Abe)
### Aliases: mcmc.pmf

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog)
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
mcmc.pmf(param.draws, t = 52, x = 0:6)
mcmc.pmf(param.draws, t = c(26, 52), x = 0:6)



