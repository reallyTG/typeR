library(strataG)


### Name: fastsimcoal
### Title: Run fastsimcoal
### Aliases: fastsimcoal fscWrite fscRead fastsimcoal

### ** Examples

## Not run: 
##D # Set fastsimcoal parameters
##D # Population information: 3 populations with Ne = 10,000, drawing 100 samples from each.
##D pop.info <- fscPopInfo(pop.size = rep(10000, 3), sample.size = rep(100, 3))
##D 
##D # Migration rates among the 3 populations
##D mig.rates <- matrix(c(0, 0.5, 0.005, 0.5, 0, 0.0005, 0.005, 0.0005, 0), ncol = 3)
##D 
##D # Define historical events in which populations diverged 2000 generations in past
##D hist.ev <- fscHistEv(
##D   num.gen = c(2000, 2000), source.deme = c(2, 1),
##D   sink.deme = c(1, 0), prop.migrants = 1
##D )
##D 
##D # Define 10 microsatellite loci, with random mutation rates
##D msat.params <- fscLocusParams(
##D   locus.type = "msat", num.loci = 1, 
##D   mut.rate = runif(10, 1e-7, 1e-4)
##D )
##D 
##D # Run simulation and display locus summary
##D sim.msats <- fastsimcoal(pop.info, msat.params, mig.rates, hist.ev)
##D summarizeLoci(sim.msats)
## End(Not run)




