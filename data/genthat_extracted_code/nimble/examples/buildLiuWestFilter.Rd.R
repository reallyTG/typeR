library(nimble)


### Name: buildLiuWestFilter
### Title: Create a Liu and West particle filter algorithm.
### Aliases: buildLiuWestFilter

### ** Examples

## Not run: 
##D model <- nimbleModel(code = ...)
##D my_LWF <- buildLiuWestFilter(model, 'x[1:100]', params = 'sigma_x')
##D Cmodel <- compileNimble(model)
##D Cmy_LWF <- compileNimble(my_LWF, project = model)
##D Cmy_LWF$run(100000)
##D lw_X <- as.matrix(Cmy_LWF$mvEWSamples, 'x')
##D 
##D #  samples from posterior of a top level parameter named sigma_x:
##D lw_sigma_x <- as.matrix(Cmy_LWF$mvEWSamples, 'sigma_x')
## End(Not run)



