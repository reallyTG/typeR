library(bayesLife)


### Name: bayesLife.mcmc
### Title: MCMC Simulation Object
### Aliases: bayesLife.mcmc
### Keywords: classes

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
# loads traces from one chain
m <- get.e0.mcmc(sim.dir, low.memory=FALSE, burnin=35, chain.ids=1)
# should have 13 rows, since 60 iterations in total minus 35 burnin with thin=2
dim(e0.mcmc(m, 1)$traces)
summary(m)



