library(pcensmix)


### Name: pcensmixSim
### Title: Fitting a Normal Mixture Model to a Simulated Progressive
###   Type-II Censored Data Using EM Algorithm
### Aliases: pcensmixSim pcensmixSim.pcgen

### ** Examples

## Not run: 
##D set.seed(100)
##D 
##D Pdat<- pcgen(r = 60, p = 0.3, data = mixgen(N = 100, dist1 = 'norm',
##D                  dist2 = 'norm', control = list(12, 2, 14, 5, 0.35)))
##D pcensmixSim(Pdat, r = 60, p = 0.3, param=c(12, 2, 14, 5, 0.35))
## End(Not run)




