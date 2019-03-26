library(EMC)


### Name: findMaxTemper
### Title: Find the maximum temperature for parallel MCMC chains
### Aliases: findMaxTemper
### Keywords: methods

### ** Examples

## Not run: 
##D coord1        <- function (xx) { xx[1] }
##D ss            <- function (xx) { sum(xx) }
##D pp            <- function (xx) { prod(xx) }
##D statsFuncList <- list(coord1, ss, pp)
##D maxTemperObj  <-
##D     with(VShapedFuncGenerator(-13579),
##D          findMaxTemper(nIters            = 15000,
##D                        statsFuncList     = statsFuncList,
##D                        temperLadder      = c(20, 15, 10, 5, 1),
##D                        startingVals      = c(0, 0),
##D                        logTarDensFunc    = logTarDensFunc,
##D                        MHPropNewFunc     = MHPropNewFunc,
##D                        levelsSaveSampFor = seq_len(5),
##D                        doFullAnal        = TRUE,
##D                        verboseLevel      = 1))
##D print(maxTemperObj)
##D print(names(maxTemperObj))
##D with(maxTemperObj,
##D  {
##D      par(mfcol = c(3, 3))
##D      for (ii in seq_along(levelsSaveSampFor)) {
##D          main <- paste('temper:', round(temperLadder[levelsSaveSampFor[ii]], 3))
##D          plot(draws[ , , ii],
##D               xlim = c(-10, 25),
##D               ylim = c(-10, 10),
##D               pch  = '.',
##D               ask  = FALSE,
##D               main = as.expression(main),
##D               xlab = as.expression(substitute(x[xii], list(xii = 1))),
##D               ylab = as.expression(substitute(x[xii], list(xii = 2))))   
##D      }
##D  })
## End(Not run)



