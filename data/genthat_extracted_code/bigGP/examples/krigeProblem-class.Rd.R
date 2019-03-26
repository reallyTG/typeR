library(bigGP)


### Name: krigeProblem-class
### Title: Class '"krigeProblem"'
### Aliases: krigeProblem-class krigeProblem 'calcH, krigeProblem-method'
###   'show, krigeProblem-method' 'initializeSlaveProblems,
###   krigeProblem-method' 'setParams, krigeProblem-method'
###   'remoteConstructMean, krigeProblem-method' 'remoteConstructCov,
###   krigeProblem-method' 'calcLogDens, krigeProblem-method'
###   'optimizeLogDens, krigeProblem-method' 'predict, krigeProblem-method'
###   'calcPostCov, krigeProblem-method' 'simulateRealizations,
###   krigeProblem-method'
### Keywords: classes

### ** Examples

## Not run: 
##D doSmallExample <- TRUE
##D 
##D if(require(fields)) {
##D 
##D if(doSmallExample){
##D   SN2011fe <- SN2011fe_subset
##D   SN2011fe_newdata <- SN2011fe_newdata_subset
##D   SN2011fe_mle <- SN2011fe_mle_subset
##D   nProc <- 3
##D } else {
##D # users should select number of processors based on their system and the
##D # size of the full example
##D nProc <- 210 
##D }
##D 
##D 
##D n <- nrow(SN2011fe)
##D m <- nrow(SN2011fe_newdata)
##D nu <- 2
##D inputs <- c(as.list(SN2011fe), as.list(SN2011fe_newdata), nu = nu)
##D 
##D prob <- krigeProblem$new("prob", numProcesses = nProc, n = n, m = m,
##D  predMeanFunction = SN2011fe_predmeanfunc, crossCovFunction = SN2011fe_crosscovfunc, 
##D predCovFunction = SN2011fe_predcovfunc, meanFunction = SN2011fe_meanfunc, 
##D covFunction = SN2011fe_covfunc,  inputs = inputs, params = SN2011fe_mle$par, 
##D data = SN2011fe$flux, packages = c("fields"))
##D 
##D prob$calcLogDens()
##D 
##D prob$optimizeLogDens(method = "L-BFGS-B", verbose = TRUE,
##D lower = rep(.Machine$double.eps, length(SN2011fe_initialParams)),
##D control = list(parscale = SN2011fe_initialParams, maxit = 2))
##D # the full optimization can take some time; only two iterations are done 
##D # are specified here; even this is not run as it takes 10s of seconds
##D 
##D prob$setParams(SN2011fe_mle$par)
##D 
##D pred <- prob$predict(ret = TRUE, se.fit = TRUE, verbose = TRUE)
##D realiz <- prob$simulateRealizations(r = 10, post = TRUE, verbose = TRUE)
##D 
##D show(prob)
##D }
## End(Not run)



