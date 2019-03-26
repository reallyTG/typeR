library(nimble)


### Name: withNimbleOptions
### Title: Temporarily set some NIMBLE options.
### Aliases: withNimbleOptions

### ** Examples

## Not run: 
##D if (!(getNimbleOption('showCompilerOutput') == FALSE)) stop()
##D nf <- nimbleFunction(run = function(){ return(0); returnType(double()) })
##D cnf <- withNimbleOptions(list(showCompilerOutput = TRUE), {
##D     if (!(getNimbleOption('showCompilerOutput') == TRUE)) stop()
##D     compileNimble(nf)
##D })
##D if (!(getNimbleOption('showCompilerOutput') == FALSE)) stop()
## End(Not run)



