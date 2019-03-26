library(bayesTFR)


### Name: country.names
### Title: Accessing Country Names
### Aliases: country.names
### Keywords: attribute

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
m <- get.tfr.mcmc(sim.dir)
country.names(m)
# these two calls should give the same answer
country.names(m, c(800, 120))
country.names(m, c(15, 20), index=TRUE)



