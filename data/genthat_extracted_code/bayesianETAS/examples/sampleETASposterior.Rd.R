library(bayesianETAS)


### Name: sampleETASposterior
### Title: Draws samples from the posterior distribution of the ETAS model
### Aliases: sampleETASposterior

### ** Examples

## Not run: 
##D beta <- 2.4; M0 <- 3; T <- 500
##D catalog <- simulateETAS(0.2, 0.2, 1.5, 0.5, 2, beta, M0, T)
##D sampleETASposterior(catalog$ts, catalog$magnitudes, M0, T, sims=5000)
## End(Not run)



