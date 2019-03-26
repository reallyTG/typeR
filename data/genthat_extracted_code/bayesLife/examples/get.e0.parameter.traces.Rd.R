library(bayesLife)


### Name: get.e0.parameter.traces
### Title: Accessing MCMC Parameter Traces
### Aliases: get.e0.parameter.traces get.e0.parameter.traces.cs
### Keywords: manip

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
##D m <- get.e0.mcmc(sim.dir)
##D e0.values <- get.e0.parameter.traces(m$mcmc.list, burnin=10, par.names="z")
##D hist(e0.values, main=colnames(e0.values))
##D 
##D e0.values.cs <- get.e0.parameter.traces.cs(m$mcmc.list, 
##D                     get.country.object("Canada", meta=m$meta),
##D                     burnin=10, par.names="z.c")
##D hist(e0.values.cs, main=colnames(e0.values.cs))
## End(Not run)



