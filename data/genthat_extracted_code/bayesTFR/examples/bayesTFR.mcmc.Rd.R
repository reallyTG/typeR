library(bayesTFR)


### Name: bayesTFR.mcmc
### Title: MCMC Simulation Object
### Aliases: bayesTFR.mcmc
### Keywords: classes

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
# loads traces from one chain
m <- get.tfr.mcmc(sim.dir, low.memory=FALSE, burnin=35, chain.ids=1)
# should have 25 rows, since 60 iterations in total minus 35 burnin
dim(tfr.mcmc(m, 1)$traces)
summary(m, chain.id=1)



