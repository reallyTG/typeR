library(bayesTFR)


### Name: get.country.object
### Title: Accessing Country Information
### Aliases: get.country.object get.countries.table
###   get.countries.table.bayesTFR.mcmc.set
###   get.countries.table.bayesTFR.prediction
### Keywords: attribute

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
m <- get.tfr.mcmc(sim.dir)
# all four calls should give the same answer
get.country.object('China', m$meta)
get.country.object(156, m$meta)
get.country.object(56, m$meta, index=TRUE)
get.country.object(156, NULL, country.table=get.countries.table(m))



