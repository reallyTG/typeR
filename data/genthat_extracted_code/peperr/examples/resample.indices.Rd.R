library(peperr)


### Name: resample.indices
### Title: Generation of indices for resampling Procedure
### Aliases: resample.indices
### Keywords: models regression survival

### ** Examples

# generate dataset: 100 patients, 20 covariates
data <- matrix(rnorm(2000), nrow=100)

# generate indices for training and test data for 10-fold cross-validation
indices <- resample.indices(n=100, sample.n = 10, method = "cv")

# create training and test data via indices
trainingsample1 <- data[indices$sample.index[[1]],]
testsample1 <- data[indices$not.in.sample[[1]],]



