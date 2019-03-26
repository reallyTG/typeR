library(robmed)


### Name: cov_ML
### Title: Maximum likelihood estimator of mean vector and covariance
###   matrix
### Aliases: cov_ML print.cov_ML
### Keywords: multivariate

### ** Examples

data("BSG2014")

# define variables
x <- "ValueDiversity"
y <- "TeamCommitment"
m <- "TaskConflict"

# compute Huber M-estimator
cov_ML(BSG2014[, c(x, y, m)])




