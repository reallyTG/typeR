library(geoCount)


### Name: repYeb
### Title: Generate Replicated Data with Estimated Parameters
### Aliases: repYeb
### Keywords: Data Simulation

### ** Examples

## Not run: 
##D # Estimate parameters from posterior samples
##D Yrep.eb <- repYeb(N.sim=2000, loc, L, res.m, est = "mode")
##D # Pre-determined parameters (also an efficient way to simulate massive data sets)
##D Yrep.eb <- repYeb(N.sim=2000, loc, L, beta = 5, sigma = 1, phi = 0.1, 
##D                   k = 1)
## End(Not run)



