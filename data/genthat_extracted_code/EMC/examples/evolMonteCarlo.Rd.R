library(EMC)


### Name: evolMonteCarlo
### Title: evolutionary Monte Carlo algorithm
### Aliases: evolMonteCarlo
### Keywords: methods

### ** Examples

## Not run: 
##D samplerObj <-
##D     with(VShapedFuncGenerator(-13579),
##D      {
##D          allMovesNTimesList <- list(MH = 1, RC = 2, SC = 2, RE = 4,
##D                                     BIRE = 2, BCE = 2, BSE = 2, CE = 2)
##D          evolMonteCarlo(nIters            = 2000,
##D                         temperLadder      = c(15, 6, 2, 1),
##D                         startingVals      = c(0, 0),
##D                         logTarDensFunc    = logTarDensFunc,
##D                         MHPropNewFunc     = MHPropNewFunc,
##D                         moveNTimesList    = allMovesNTimesList,
##D                         SCRWMNTimes       = 1,
##D                         SCRWMPropSD       = 3.0,
##D                         levelsSaveSampFor = seq_len(4),
##D                         verboseLevel      = 1)
##D      })
##D print(samplerObj)
##D print(names(samplerObj))
##D with(samplerObj,
##D  {
##D      print(detailedAcceptRatios)
##D      print(dim(draws))
##D      par(mfcol = c(2, 2))
##D      for (ii in seq_along(levelsSaveSampFor)) {
##D          main <- paste('temper:', round(temperLadder[levelsSaveSampFor[ii]], 3))
##D          plot(draws[ , , ii],
##D               xlim = c(-5, 20),
##D               ylim = c(-8, 8),
##D               pch  = '.',
##D               ask  = FALSE,
##D               main = as.expression(main),
##D               xlab = as.expression(substitute(x[xii], list(xii = 1))),
##D               ylab = as.expression(substitute(x[xii], list(xii = 2))))
##D      }
##D  })
## End(Not run)



