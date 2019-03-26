library(nimble)


### Name: buildEnsembleKF
### Title: Create an Ensemble Kalman filter algorithm to sample from latent
###   states.
### Aliases: buildEnsembleKF

### ** Examples

## Not run: 
##D model <- nimbleModel(code = ...)
##D my_ENKFF <- buildEnsembleKF(model, 'x')
##D Cmodel <- compileNimble(model)
##D Cmy_ENKF <- compileNimble(my_ENKF, project = model)
##D Cmy_ENKF$run(m = 100000)
##D ENKF_X <- as.matrix(Cmy_ENKF$mvSamples, 'x')
##D hist(ENKF_X)
## End(Not run)



