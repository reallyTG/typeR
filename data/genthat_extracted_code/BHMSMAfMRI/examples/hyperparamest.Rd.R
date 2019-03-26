library(BHMSMAfMRI)


### Name: hyperparamest
### Title: Get the estimates of the hyperparameters of the BHMSME model
###   along with the estimate of their covariance matrix.
### Aliases: hyperparamest

### ** Examples

nsubject <- 3
grid <- 8
WaveletCoefficientMatrix <- array(dim=c(3,63),rnorm(3*63))
analysis <- "multi"
hyper.est <- hyperparamest(nsubject, grid, WaveletCoefficientMatrix, analysis)



