library(bayesLife)


### Name: summary.bayesLife.mcmc.set
### Title: Summary Statistics for Life Expectancy MCMCs
### Aliases: summary.bayesLife.mcmc.set print.summary.bayesLife.mcmc.set
###   print.summary.bayesLife.mcmc.set.meta summary.bayesLife.mcmc
### Keywords: univar

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
m <- get.e0.mcmc(sim.dir)
summary(m, country="Czechia", burnin=20)



