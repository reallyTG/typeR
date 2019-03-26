library(EmpiricalCalibration)


### Name: fitMcmcNull
### Title: Fit the null distribution using MCMC
### Aliases: fitMcmcNull

### ** Examples

## Not run: 
##D data(sccs)
##D negatives <- sccs[sccs$groundTruth == 0, ]
##D null <- fitMcmcNull(negatives$logRr, negatives$seLogRr)
##D null
##D plotMcmcTrace(null)
##D positive <- sccs[sccs$groundTruth == 1, ]
##D calibrateP(null, positive$logRr, positive$seLogRr)
## End(Not run)



