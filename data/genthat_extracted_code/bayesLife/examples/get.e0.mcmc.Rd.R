library(bayesLife)


### Name: get.e0.mcmc
### Title: Accessing MCMC Results
### Aliases: get.e0.mcmc has.e0.mcmc e0.mcmc e0.mcmc.list
### Keywords: programming

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
m <- get.e0.mcmc(sim.dir)
summary(m)

# summary of the world parameters for the single chains
for(mc in e0.mcmc.list(m)) print(summary(mc, par.names.cs=NULL))



