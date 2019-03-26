library(bayesTFR)


### Name: bayesTFR.mcmc.meta
### Title: MCMC Simulation Meta Object
### Aliases: bayesTFR.mcmc.meta
### Keywords: classes

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
m <- get.tfr.mcmc(sim.dir)
summary(m, meta.only = TRUE)
names(m$meta)



