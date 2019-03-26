library(bigGP)


### Name: collectRectangularMatrix
### Title: Return a Distributed Rectangular Matrix to the Master Process
### Aliases: collectRectangularMatrix

### ** Examples

## Not run: 
##D if(require(fields)) {
##D nProc <- 3
##D n <- nrow(SN2011fe_subset)
##D m <- nrow(SN2011fe_newdata_subset)
##D inputs <- c(as.list(SN2011fe_subset), as.list(SN2011fe_newdata_subset),
##D   nu =2)
##D # initialize the problem
##D prob <- krigeProblem$new("prob", h_n = 1, h_m = 1, numProcesses =
##D   nProc, n = n, m = m,
##D   meanFunction = SN2011fe_meanfunc, predMeanFunction = SN2011fe_predmeanfunc, 
##D   covFunction = SN2011fe_covfunc, crossCovFunction = SN2011fe_crosscovfunc,
##D predCovFunction = SN2011fe_predcovfunc, params = SN2011fe_mle$par,
##D   inputs = inputs, data = SN2011fe_subset$flux, packages = c("fields"))
##D # do predictions, primarily so cross-covariance gets calculated
##D pred <- prob$predict(ret = TRUE, verbose = TRUE)
##D 
##D crossC <- collectRectangularMatrix('crossC', "prob", n1 = n, n2 = m,
##D h1 = 1, h2 = 1)
##D crossC[1:5, 1:5]
##D }
## End(Not run)



