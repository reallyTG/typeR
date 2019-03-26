library(bayesianETAS)


### Name: maxLikelihoodETAS
### Title: Estimate the parameters of the ETAS model using maximum
###   likelihood.
### Aliases: maxLikelihoodETAS

### ** Examples

## Not run: 
##D beta <- 2.4; M0 <- 3; T <- 500
##D catalog <- simulateETAS(0.2, 0.2, 1.5, 0.5, 2, beta, M0, T)
##D maxLikelihoodETAS(catalog$ts, catalog$magnitudes, M0, 500)
## End(Not run)



