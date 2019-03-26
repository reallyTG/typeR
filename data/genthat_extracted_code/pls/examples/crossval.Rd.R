library(pls)


### Name: crossval
### Title: Cross-validation of PLSR and PCR models
### Aliases: crossval
### Keywords: regression multivariate

### ** Examples

data(yarn)
yarn.pcr <- pcr(density ~ msc(NIR), 6, data = yarn)
yarn.cv <- crossval(yarn.pcr, segments = 10)
## Not run: plot(MSEP(yarn.cv))

## Not run: 
##D ## Parallelised cross-validation, using transient cluster:
##D pls.options(parallel = 4) # use mclapply (not available on Windows)
##D pls.options(parallel = quote(parallel::makeCluster(4, type = "PSOCK"))) # parLapply
##D ## A new cluster is created and stopped for each cross-validation:
##D yarn.cv <- crossval(yarn.pcr)
##D yarn.loocv <- crossval(yarn.pcr, length.seg = 1)
##D 
##D ## Parallelised cross-validation, using persistent cluster:
##D library(parallel)
##D ## This creates the cluster:
##D pls.options(parallel = makeCluster(4, type = "FORK")) # not available on Windows
##D pls.options(parallel = makeCluster(4, type = "PSOCK"))
##D ## The cluster can be used several times:
##D yarn.cv <- crossval(yarn.pcr)
##D yarn.loocv <- crossval(yarn.pcr, length.seg = 1)
##D ## The cluster should be stopped manually afterwards:
##D stopCluster(pls.options()$parallel)
##D 
##D ## Parallelised cross-validation, using persistent MPI cluster:
##D ## This requires the packages snow and Rmpi to be installed
##D library(parallel)
##D ## This creates the cluster:
##D pls.options(parallel = makeCluster(4, type = "MPI"))
##D ## The cluster can be used several times:
##D yarn.cv <- crossval(yarn.pcr)
##D yarn.loocv <- crossval(yarn.pcr, length.seg = 1)
##D ## The cluster should be stopped manually afterwards:
##D stopCluster(pls.options()$parallel)
##D ## It is good practice to call mpi.exit() or mpi.quit() afterwards:
##D mpi.exit()
## End(Not run)



