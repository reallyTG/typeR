library(BTYDplus)


### Name: pggg.plotRegularityRateHeterogeneity
### Title: Pareto/GGG Plot Regularity Rate Heterogeneity
### Aliases: pggg.plotRegularityRateHeterogeneity

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
param.draws <- pggg.mcmc.DrawParameters(cbs,
  mcmc = 20, burnin = 10, thin = 2, chains = 1) # short MCMC to run demo fast
pggg.plotRegularityRateHeterogeneity(param.draws)



