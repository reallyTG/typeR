library(bayesTFR)


### Name: get.tfr.parameter.traces
### Title: Accessing MCMC Parameter Traces
### Aliases: get.tfr.parameter.traces get.tfr.parameter.traces.cs
###   get.tfr3.parameter.traces get.tfr3.parameter.traces.cs
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
m <- get.tfr.mcmc(sim.dir)
tfr.values <- get.tfr.parameter.traces(m$mcmc.list, burnin=10, par.names="sigma0")
## Not run: 
##D hist(tfr.values, main=colnames(tfr.values))
## End(Not run)
tfr.values.cs <- get.tfr.parameter.traces.cs(m$mcmc.list, 
                    get.country.object("Canada", meta=m$meta),
                    burnin=10, par.names="Triangle_c4")
## Not run: 
##D hist(tfr.values.cs, main=colnames(tfr.values.cs))
## End(Not run)



