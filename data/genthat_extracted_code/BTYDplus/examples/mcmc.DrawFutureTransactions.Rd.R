library(BTYDplus)


### Name: mcmc.DrawFutureTransactions
### Title: Draws number of future transactions based on MCMC parameter
###   draws
### Aliases: mcmc.DrawFutureTransactions

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
xstar.draws <- mcmc.DrawFutureTransactions(cbs, param.draws)
cbs$xstar.est <- apply(xstar.draws, 2, mean)
cbs$pactive <- mcmc.PActive(xstar.draws)
head(cbs)



