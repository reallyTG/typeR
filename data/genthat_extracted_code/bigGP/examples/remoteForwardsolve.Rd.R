library(bigGP)


### Name: remoteForwardsolve
### Title: Solve a Distributed Triangular System
### Aliases: remoteForwardsolve remoteBacksolve

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
##D remoteCalcChol(matName = "C", cholName = "L", matPos = "prob",
##D   cholPos = "prob", n = n, h = prob$h_n)
##D remoteForwardsolve(cholName = "L", inputName = "data", outputName =
##D "tmp", cholPos = "prob", inputPos = "prob", n1 = n, h1 = prob$h_n)
##D LinvY <- collectVector("tmp", n = n, h = prob$h_n)
##D remoteBacksolve(cholName = "L", inputName = "tmp", outputName =
##D "tmp2", cholPos = "prob", inputPos = "prob", n1 = n, h1 = prob$h_n)
##D CinvY <- collectVector("tmp2", n = n, h = prob$h_n)
##D }
## End(Not run)



