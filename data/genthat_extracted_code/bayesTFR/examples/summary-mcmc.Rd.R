library(bayesTFR)


### Name: summary.bayesTFR.mcmc.set
### Title: Summary Statistics for TFR Markov Chain Monte Carlo Chains
### Aliases: summary.bayesTFR.mcmc.set print.summary.bayesTFR.mcmc.set
###   print.summary.bayesTFR.mcmc.set.meta summary.bayesTFR.mcmc
### Keywords: univar

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
m <- get.tfr.mcmc(sim.dir)
summary(m, country="Czechia", burnin=15)



