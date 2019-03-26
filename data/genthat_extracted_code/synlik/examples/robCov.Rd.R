library(synlik)


### Name: robCov
### Title: Robust covariance matrix estimation
### Aliases: robCov

### ** Examples

p <- 5;n <- 100
Y <- matrix(runif(p*n),p,n)
robCov(Y)



