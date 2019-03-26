library(BTYDplus)


### Name: mcmc.PAlive
### Title: Calculates P(alive) based on MCMC parameter draws
### Aliases: mcmc.PAlive

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog)
param.draws <- pnbd.mcmc.DrawParameters(cbs,
  mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
palive <- mcmc.PAlive(param.draws)
head(palive)
mean(palive)



