library(bigGP)


### Name: SN2011fe
### Title: SN2011fe Supernova Dataset
### Aliases: SN2011fe SN2011fe_subset SN2011fe_newdata
###   SN2011fe_newdata_subset SN2011fe_mle SN2011fe_mle_subset
###   SN2011fe_initialParams SN2011fe_meanfunc SN2011fe_predmeanfunc
###   SN2011fe_covfunc SN2011fe_crosscovfunc SN2011fe_predcovfunc

### ** Examples

## Not run: 
##D doSmallExample <- TRUE
##D 
##D if(require(fields)) {
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
##D n <- nrow(SN2011fe)
##D m <- nrow(SN2011fe_newdata)
##D nu <- 2
##D inputs <- c(as.list(SN2011fe), as.list(SN2011fe_newdata), nu = nu)
##D 
##D prob <- krigeProblem$new("prob", numProcesses = nProc, n = n, m = m,
##D predMeanFunction = SN2011fe_predmeanfunc, crossCovFunction = SN2011fe_crosscovfunc,
##D predCovFunction = SN2011fe_predcovfunc, meanFunction =
##D SN2011fe_meanfunc, covFunction = SN2011fe_covfunc,  inputs = inputs,
##D params = SN2011fe_mle$par, data = SN2011fe$flux, packages = c("fields"))
##D 
##D prob$calcLogDens()
##D }
## End(Not run)



