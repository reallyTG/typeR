library(bigGP)


### Name: collectDiagonal
### Title: Return the Diagonal of a Distributed Square Matrix to the Master
###   Process
### Aliases: collectDiagonal

### ** Examples

## Not run: 
##D if(require(fields)) {
##D nProc <- 3
##D n <- nrow(SN2011fe_subset)
##D inputs <- c(as.list(SN2011fe_subset), as.list(SN2011fe_newdata_subset),
##D   nu =2)
##D # initialize the problem
##D prob <- krigeProblem$new("prob", h_n = 1, numProcesses = nProc, n = n,
##D   meanFunction = SN2011fe_meanfunc, covFunction = SN2011fe_covfunc,
##D   inputs = inputs, params = SN2011fe_mle$par,
##D   data = SN2011fe_subset$flux, packages = c("fields"))
##D # calculate log density, primarily so Cholesky gets calculated
##D prob$calcLogDens()
##D diagC <- collectDiagonal('C', "prob", n = n, h = 1)
##D diagL <- collectDiagonal('L', "prob", n = n, h = 1)
##D diagC[1:5]
##D diagL[1:5]
##D }
## End(Not run)



