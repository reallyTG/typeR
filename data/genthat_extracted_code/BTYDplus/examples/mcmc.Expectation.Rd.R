library(BTYDplus)


### Name: mcmc.Expectation
### Title: Unconditional Expectation for Pareto/GGG, Pareto/NBD (HB) and
###   Pareto/NBD (Abe)
### Aliases: mcmc.Expectation

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog)
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
mcmc.Expectation(param.draws, t = c(26, 52))



