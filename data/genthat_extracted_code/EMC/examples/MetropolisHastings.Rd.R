library(EMC)


### Name: MetropolisHastings
### Title: The Metropolis-Hastings algorithm
### Aliases: MetropolisHastings
### Keywords: methods

### ** Examples

## Not run: 
##D samplerObj <-
##D     with(CigarShapedFuncGenerator2(-13579),
##D          MetropolisHastings(nIters          = 5000,
##D                             startingVal     = c(0, 0),
##D                             logTarDensFunc  = logTarDensFunc,
##D                             propNewFunc     = propNewFunc,
##D                             logPropDensFunc = logPropDensFunc,
##D                             verboseLevel    = 2))
##D print(samplerObj)
##D print(names(samplerObj))
##D with(samplerObj,
##D  {
##D      print(detailedAcceptRatios)
##D      print(dim(draws))
##D      plot(draws,
##D           xlim = c(-3, 5),
##D           ylim = c(-3, 4),
##D           pch  = '.',
##D           ask  = FALSE,
##D           main = as.expression(paste('# draws:', nIters)),
##D           xlab = as.expression(substitute(x[xii], list(xii = 1))),
##D           ylab = as.expression(substitute(x[xii], list(xii = 2))))    
##D  })
## End(Not run)



