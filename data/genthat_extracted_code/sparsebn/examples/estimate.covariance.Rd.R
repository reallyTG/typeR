library(sparsebn)


### Name: estimate.covariance
### Title: Covariance estimation
### Aliases: estimate.covariance estimate.covariance estimate.precision

### ** Examples


data(cytometryContinuous)
dat <- sparsebnData(cytometryContinuous$data, type = "c", ivn = cytometryContinuous$ivn)
estimate.covariance(dat) # estimate covariance
estimate.precision(dat)  # estimate precision




