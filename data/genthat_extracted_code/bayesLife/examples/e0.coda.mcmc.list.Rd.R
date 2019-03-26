library(bayesLife)


### Name: e0.coda.list.mcmc
### Title: Convertion to coda's Objects
### Aliases: e0.coda.list.mcmc coda.mcmc.bayesLife.mcmc
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
coda.list <- e0.coda.list.mcmc(sim.dir=sim.dir, country="France", burnin=30)
summary(coda.list)



