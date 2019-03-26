library(bigGP)


### Name: remoteCrossProdMatSelf
### Title: Distributed Crossproduct of a Rectangular Matrix with Itself
### Aliases: remoteCrossProdMatSelf remoteCrossProdMatSelfDiag

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
##D predMeanFunction = SN2011fe_predmeanfunc, crossCovFunction =
##D SN2011fe_crosscovfunc,  predCovFunction = SN2011fe_predcovfunc,
##D meanFunction = SN2011fe_meanfunc, covFunction = SN2011fe_covfunc,
##D inputs = inputs, params = SN2011fe_mle$par, data = SN2011fe$flux,
##D packages = c("fields"))
##D 
##D remoteCalcChol(matName = "C", cholName = "L", matPos = "prob",
##D   cholPos = "prob", n = n, h = prob$h_n)
##D prob$remoteConstructCov(obs = FALSE, pred = FALSE, cross = TRUE, verbose = TRUE)
##D # we now have a rectangular cross-covariance matrix named 'crossC'
##D remoteForwardsolve(cholName = "L", inputName = "crossC", outputName = "tmp1", 
##D cholPos = "prob", inputPos = "prob", n1 = n, n2 = m, h1 = prob$h_n, h2 = prob$h_m)
##D 
##D remoteCrossProdMatSelf(inputName = "tmp1", outputName = "result", n1 = n,
##D n2 = m, h1 = prob$h_n, h2 = prob$h_m)
##D result <- collectTriangularMatrix("result", n = m, h = prob$h_m)
##D 
##D remoteCrossProdMatSelfDiag(inputName = "tmp1", outputName = "resultDiag",
##D n1 = n, n2 = m, h1 = prob$h_n, h2 = prob$h_m)
##D resultDiag <- collectVector("resultDiag", n = m, h = prob$h_m)
##D }
## End(Not run)



