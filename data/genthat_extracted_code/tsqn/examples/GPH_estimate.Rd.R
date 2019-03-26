library(tsqn)


### Name: GPH_estimate
### Title: Classical and Robust Geweke and Porter-Hudak (GPH) estimators
###   for the long-memory parameter d of a long-range dependent stationary
###   processes
### Aliases: GPH_estimate

### ** Examples

library(fracdiff)
simseries <- fracdiff.sim(1500, d = 0.3)
GPH_estimate(simseries$series,method="GPH")$d
## Not run: 
##D GPH_estimate(simseries$series,method="GPH-Qn")$d
##D GPH_estimate(simseries$series,method="GPH-M")$d
## End(Not run)



