library(EmpiricalCalibration)


### Name: plotMcmcTrace
### Title: Plot the MCMC trace
### Aliases: plotMcmcTrace

### ** Examples

## Not run: 
##D data(sccs)
##D negatives <- sccs[sccs$groundTruth == 0, ]
##D null <- fitMcmcNull(negatives$logRr, negatives$seLogRr)
##D plotMcmcTrace(null)
## End(Not run)



