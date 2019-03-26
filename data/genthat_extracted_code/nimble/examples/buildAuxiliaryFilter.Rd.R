library(nimble)


### Name: buildAuxiliaryFilter
### Title: Create an auxiliary particle filter algorithm to estimate
###   log-likelihood.
### Aliases: buildAuxiliaryFilter

### ** Examples

## Not run: 
##D model <- nimbleModel(code = ...)
##D my_AuxF <- buildAuxiliaryFilter(model, 'x[1:100]',
##D    control = list(saveAll = TRUE, lookahead = 'mean'))
##D Cmodel <- compileNimble(model)
##D Cmy_AuxF <- compileNimble(my_AuxF, project = model)
##D logLike <- Cmy_AuxF$run(m = 100000)
##D ESS <- Cmy_AuxF$returnESS(m = 100000)
##D hist(as.matrix(Cmy_Auxf$mvEWSamples, 'x'))
## End(Not run)



