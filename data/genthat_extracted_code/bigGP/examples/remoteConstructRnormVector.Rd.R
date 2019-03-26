library(bigGP)


### Name: remoteConstructRnormVector
### Title: Create Distributed Vector or Matrix of Random Normals
### Aliases: remoteConstructRnormVector remoteConstructRnormMatrix

### ** Examples

## Not run: 
##D if(require(fields)) {
##D   SN2011fe <- SN2011fe_subset
##D   SN2011fe_newdata <- SN2011fe_newdata_subset
##D   SN2011fe_mle <- SN2011fe_mle_subset
##D   nProc <- 3
##D n <- nrow(SN2011fe)
##D m <- nrow(SN2011fe_newdata)
##D nu <- 2
##D inputs <- c(as.list(SN2011fe), as.list(SN2011fe_newdata), nu = nu)
##D prob <- krigeProblem$new("prob", numProcesses = nProc, n = n, m = m,
##D predMeanFunction = SN2011fe_predmeanfunc, crossCovFunction = SN2011fe_crosscovfunc,  
##D predCovFunction = SN2011fe_predcovfunc, meanFunction = SN2011fe_meanfunc, 
##D covFunction = SN2011fe_covfunc,  inputs = inputs, params = SN2011fe_mle$par, 
##D data = SN2011fe$flux, packages = c("fields"))
##D remoteCalcChol(matName = 'C', cholName = 'L', matPos = 'prob',
##D   cholPos = 'prob', n = n, h = prob$h_n)
##D remoteConstructRnormVector('z', n = n, h = prob$h_n)
##D remoteMultChol(cholName = 'L', inputName = 'z', outputName = 'result',
##D cholPos = 'prob', n1 = n, h1 = prob$h_n)
##D realiz <- collectVector('result', n = n, h = prob$h_n)
##D 
##D r = 10
##D remoteConstructRnormMatrix('z2', n1 = n, n2 = r, h1 = prob$h_n, h2 = 1)
##D remoteMultChol(cholName = 'L', inputName = 'z2', outputName = 'result2',
##D cholPos = 'prob', n1 = n, n2 = r, h1 = prob$h_n, h2 = 1)
##D realiz2 <- collectRectangularMatrix('result2', n1 = prob$n, n2 = r, h1
##D = prob$h_n, h2 = 1)
##D }
## End(Not run)



