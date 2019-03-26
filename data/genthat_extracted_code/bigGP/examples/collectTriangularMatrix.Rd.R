library(bigGP)


### Name: collectTriangularMatrix
### Title: Return a Distributed Symmetric or Triangular Matrix to the
###   Master Process
### Aliases: collectTriangularMatrix

### ** Examples

## Not run: 
##D if(require(fields)) {
##D nProc <- 3
##D n <- nrow(SN2011fe_subset)
##D inputs <- c(as.list(SN2011fe_subset), as.list(SN2011fe_newdata_subset),
##D   nu =2)
##D # initialize the problem
##D prob <- krigeProblem$new("prob", h_n = 1, numProcesses = nProc, n = n,
##D   meanFunction = SN2011fe_meanfunc, covFunction = SN2011fe_covfunc, inputs = inputs,
##D   params = SN2011fe_mle$par, data = SN2011fe_subset$flux, packages =
##D   c("fields"))
##D # calculate log density, primarily so Cholesky gets calculated
##D prob$calcLogDens()
##D C <- collectTriangularMatrix('C', "prob", n = n, h = 1)
##D L <- collectTriangularMatrix('L', "prob", n = n, h = 1)
##D C[1:5, 1:5]
##D L[1:5, 1:5]
##D }
## End(Not run)



