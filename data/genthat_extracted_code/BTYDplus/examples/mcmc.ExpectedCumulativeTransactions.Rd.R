library(BTYDplus)


### Name: mcmc.ExpectedCumulativeTransactions
### Title: Expected Cumulative Transactions for Pareto/GGG, Pareto/NBD (HB)
###   and Pareto/NBD (Abe)
### Aliases: mcmc.ExpectedCumulativeTransactions

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog)
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
# Returns a vector containing expected cumulative repeat transactions for 104
# weeks, with every eigth week being reported.
mcmc.ExpectedCumulativeTransactions(param.draws,
  T.cal = cbs$T.cal, T.tot = 104, n.periods.final = 104/8, sample_size = 1000)



