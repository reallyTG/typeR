library(coin)


### Name: NullDistribution
### Title: Specification of the Reference Distribution
### Aliases: asymptotic approximate exact
### Keywords: htest

### ** Examples

## Approximative (Monte Carlo) Cochran-Mantel-Haenszel test

## Serial operation
set.seed(123)
cmh_test(disease ~ smoking | gender, data = alzheimer,
         distribution = approximate(B = 100000))

## Not run: 
##D ## Multicore with 8 processes (not for MS Windows)
##D set.seed(123, kind = "L'Ecuyer-CMRG")
##D cmh_test(disease ~ smoking | gender, data = alzheimer,
##D          distribution = approximate(B = 100000,
##D                                     parallel = "multicore", ncpus = 8))
##D 
##D ## Automatic PSOCK cluster with 4 processes
##D set.seed(123, kind = "L'Ecuyer-CMRG")
##D cmh_test(disease ~ smoking | gender, data = alzheimer,
##D          distribution = approximate(B = 100000,
##D                                     parallel = "snow", ncpus = 4))
##D 
##D ## Registered FORK cluster with 12 processes (not for MS Windows)
##D fork12 <- parallel::makeCluster(12, "FORK") # set-up cluster
##D parallel::setDefaultCluster(fork12) # register default cluster
##D set.seed(123, kind = "L'Ecuyer-CMRG")
##D cmh_test(disease ~ smoking | gender, data = alzheimer,
##D          distribution = approximate(B = 100000,
##D                                     parallel = "snow"))
##D parallel::stopCluster(fork12) # clean-up
##D 
##D ## User-specified PSOCK cluster with 8 processes
##D psock8 <- parallel::makeCluster(8, "PSOCK") # set-up cluster
##D set.seed(123, kind = "L'Ecuyer-CMRG")
##D cmh_test(disease ~ smoking | gender, data = alzheimer,
##D          distribution = approximate(B = 100000,
##D                                     parallel = "snow", cl = psock8))
##D parallel::stopCluster(psock8) # clean-up
## End(Not run)



