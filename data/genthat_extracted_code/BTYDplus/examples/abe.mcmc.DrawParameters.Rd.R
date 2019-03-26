library(BTYDplus)


### Name: abe.mcmc.DrawParameters
### Title: Pareto/NBD (Abe) Parameter Draws
### Aliases: abe.mcmc.DrawParameters

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
cbs$cov1 <- as.integer(cbs$cust) %% 2 # create dummy covariate
param.draws <- abe.mcmc.DrawParameters(cbs, c("cov1"),
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast

# cohort-level parameter draws
as.matrix(param.draws$level_2)
# customer-level parameter draws for customer with ID '4'
as.matrix(param.draws$level_1[["4"]])

# estimate future transactions
xstar.draws <- mcmc.DrawFutureTransactions(cbs, param.draws, cbs$T.star)
xstar.est <- apply(xstar.draws, 2, mean)
head(xstar.est)



