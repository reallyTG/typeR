library(nimble)


### Name: buildBootstrapFilter
### Title: Create a bootstrap particle filter algorithm to estimate
###   log-likelihood.
### Aliases: buildBootstrapFilter

### ** Examples

## Not run: 
##D model <- nimbleModel(code = ...)
##D my_BootF <- buildBootstrapFilter(model, 'x[1:100]', control = list(thresh  = 1))
##D Cmodel <- compileNimble(model)
##D Cmy_BootF <- compileNimble(my_BootF, project = model)
##D logLike <- Cmy_BootF$run(m = 100000)
##D ESS <- Cmy_BootF$returnESS()
##D boot_X <- as.matrix(Cmy_BootF$mvEWSamples)
## End(Not run)



