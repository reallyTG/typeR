library(BTYDplus)


### Name: mcmc.PActive
### Title: Calculates P(active) based on drawn future transactions.
### Aliases: mcmc.PActive

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
xstar.draws <- mcmc.DrawFutureTransactions(cbs, param.draws)
cbs$pactive <- mcmc.PActive(xstar.draws)
head(cbs)



