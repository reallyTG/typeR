library(EMC)


### Name: placeTempers
### Title: Place the intermediate temperatures between the temperature
###   limits
### Aliases: placeTempers
### Keywords: methods

### ** Examples

## Not run: 
##D placeTempersObj <-
##D     with(VShapedFuncGenerator(-13579),
##D          placeTempers(nIters            = 10000,
##D                       acceptRatioLimits = c(0.5, 0.6),
##D                       ladderLenMax      = 50,
##D                       startingVals      = c(0, 0),
##D                       logTarDensFunc    = logTarDensFunc,
##D                       MHPropNewFunc     = MHPropNewFunc,
##D                       temperLimits      = c(1, 5),
##D                       ladderLen         = 10,
##D                       levelsSaveSampFor = seq_len(10),
##D                       verboseLevel      = 1))
##D print(placeTempersObj)
##D print(names(placeTempersObj))
##D with(placeTempersObj,
##D  {
##D      par(mfcol = c(3, 3))
##D      for (ii in seq_along(levelsSaveSampFor)) {
##D          main <- paste('temper:', round(temperLadder[levelsSaveSampFor[ii]], 3))
##D          plot(draws[ , , ii],
##D               xlim = c(-4, 20),
##D               ylim = c(-8, 8),
##D               pch  = '.',
##D               ask  = FALSE,
##D               main = as.expression(main),
##D               xlab = as.expression(substitute(x[xii], list(xii = 1))),
##D               ylab = as.expression(substitute(x[xii], list(xii = 2))))   
##D      }
##D  })
## End(Not run)



