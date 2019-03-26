library(bayesTFR)


### Name: get.tfr.mcmc
### Title: Accessing MCMC Results
### Aliases: get.tfr.mcmc has.tfr.mcmc tfr.mcmc tfr.mcmc.list get.tfr3.mcmc
###   has.tfr3.mcmc
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
m <- get.tfr.mcmc(sim.dir)
summary(m)

# summary of the single chains
for(mc in tfr.mcmc.list(m)) print(summary(mc))



