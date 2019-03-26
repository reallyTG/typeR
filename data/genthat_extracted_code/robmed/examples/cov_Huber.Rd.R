library(robmed)


### Name: cov_Huber
### Title: Huber M-estimator of location and scatter
### Aliases: cov_Huber print.cov_Huber
### Keywords: multivariate

### ** Examples

data("BSG2014")

# define variables
x <- "ValueDiversity"
y <- "TeamCommitment"
m <- "TaskConflict"

# compute Huber M-estimator
cov_Huber(BSG2014[, c(x, y, m)])




