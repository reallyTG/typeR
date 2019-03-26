library(BTYDplus)


### Name: pggg.mcmc.DrawParameters
### Title: Pareto/GGG Parameter Draws
### Aliases: pggg.mcmc.DrawParameters

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
param.draws <- pggg.mcmc.DrawParameters(cbs,
  mcmc = 20, burnin = 10, thin = 2, chains = 1) # short MCMC to run demo fast

# cohort-level parameter draws
as.matrix(param.draws$level_2)
# customer-level parameter draws for customer with ID '4'
as.matrix(param.draws$level_1[["4"]])

# estimate future transactions
xstar.draws <- mcmc.DrawFutureTransactions(cbs, param.draws, cbs$T.star)
xstar.est <- apply(xstar.draws, 2, mean)
head(xstar.est)



