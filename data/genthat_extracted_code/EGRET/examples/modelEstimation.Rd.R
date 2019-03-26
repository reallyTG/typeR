library(EGRET)


### Name: modelEstimation
### Title: Estimation process for the WRTDS (Weighted Regressions on Time,
###   Discharge, and Season)
### Aliases: modelEstimation
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
## Not run: 
##D  
##D #Run an estimation adjusting windowQ from default:
##D eList <- modelEstimation(eList, windowQ=5)
##D 
##D library(doParallel)
##D nCores <- parallel::detectCores() - 1
##D cl <- makePSOCKcluster(nCores)
##D registerDoParallel(cl)
##D eList <- modelEstimation(eList, windowQ=5, run.parallel = TRUE)
##D stopCluster(cl)
## End(Not run)



