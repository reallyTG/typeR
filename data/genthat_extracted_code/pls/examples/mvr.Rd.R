library(pls)


### Name: mvr
### Title: Partial Least Squares and Principal Component Regression
### Aliases: mvr pcr plsr cppls
### Keywords: regression multivariate

### ** Examples

data(yarn)
## Default methods:
yarn.pcr <- pcr(density ~ NIR, 6, data = yarn, validation = "CV")
yarn.pls <- plsr(density ~ NIR, 6, data = yarn, validation = "CV")
yarn.cppls <- cppls(density ~ NIR, 6, data = yarn, validation = "CV")

## Alternative methods:
yarn.oscorespls <- mvr(density ~ NIR, 6, data = yarn, validation = "CV",
                      method = "oscorespls")
yarn.simpls <- mvr(density ~ NIR, 6, data = yarn, validation = "CV",
                  method = "simpls")

## Not run: 
##D ## Parallelised cross-validation, using transient cluster:
##D pls.options(parallel = 4) # use mclapply
##D pls.options(parallel = quote(makeCluster(4, type = "PSOCK"))) # use parLapply
##D ## A new cluster is created and stopped for each cross-validation:
##D yarn.pls <- plsr(density ~ NIR, 6, data = yarn, validation = "CV")
##D yarn.pcr <- pcr(density ~ NIR, 6, data = yarn, validation = "CV")
##D 
##D ## Parallelised cross-validation, using persistent cluster:
##D library(parallel)
##D ## This creates the cluster:
##D pls.options(parallel = makeCluster(4, type = "PSOCK"))
##D ## The cluster can be used several times:
##D yarn.pls <- plsr(density ~ NIR, 6, data = yarn, validation = "CV")
##D yarn.pcr <- pcr(density ~ NIR, 6, data = yarn, validation = "CV")
##D ## The cluster should be stopped manually afterwards:
##D stopCluster(pls.options()$parallel)
##D 
##D ## Parallelised cross-validation, using persistent MPI cluster:
##D ## This requires the packages snow and Rmpi to be installed
##D library(parallel)
##D ## This creates the cluster:
##D pls.options(parallel = makeCluster(4, type = "MPI"))
##D ## The cluster can be used several times:
##D yarn.pls <- plsr(density ~ NIR, 6, data = yarn, validation = "CV")
##D yarn.pcr <- pcr(density ~ NIR, 6, data = yarn, validation = "CV")
##D ## The cluster should be stopped manually afterwards:
##D stopCluster(pls.options()$parallel)
##D ## It is good practice to call mpi.exit() or mpi.quit() afterwards:
##D mpi.exit()
## End(Not run)

## Multi-response models:
data(oliveoil)
sens.pcr <- pcr(sensory ~ chemical, ncomp = 4, scale = TRUE, data = oliveoil)
sens.pls <- plsr(sensory ~ chemical, ncomp = 4, scale = TRUE, data = oliveoil)

## Classification
# A classification example utilizing additional response information
# (Y.add) is found in the cppls.fit manual ('See also' above).



