library(pensim)


### Name: pensim-package
### Title: Functions and data for simulation of high-dimensional data and
###   parallelized repeated penalized regression
### Aliases: pensim-package pensim
### Keywords: package survival datagen regression multivariate

### ** Examples

set.seed(9)
##create some data,  with one of a group of five correlated variables
##having an association with the binary outcome:
x <- create.data(nvars=c(10, 3), cors=c(0, 0.8), 
  associations=c(0, 2), firstonly=c(TRUE, TRUE), nsamples=50, 
  response="binary", logisticintercept=0.5)
x$summary
##predictor data frame and binary response vector
pen.data <- x$data[, -match("outcome", colnames(x$data))]
response <- x$data[, match("outcome", colnames(x$data))]
## lasso regression.  Note that epsilon=1e-2 is passed onto optL1,  and
## reduces the precision of the tuning compared to the default 1e-10.
output <- opt1D(nsim=1, nprocessors=1, penalized=pen.data, response=response,  epsilon=1e-2)
cc <- output[which.max(output[, "cvl"]), -1:-3]  ##non-zero b.* are true positives



