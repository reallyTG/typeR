library(bayesLife)


### Name: bayesLife.mcmc.meta
### Title: MCMC Simulation Meta Object
### Aliases: bayesLife.mcmc.meta
### Keywords: classes

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
m <- get.e0.mcmc(sim.dir)
summary(m, meta.only = TRUE)
names(m$meta)



