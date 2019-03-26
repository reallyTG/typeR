library(RandomFields)


### Name: RMfixcov
### Title: Fixed Covariance Matrix
### Aliases: RMfixcov
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample(reduce=FALSE)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


## Example 1 showing that the covariance structure is correctly implemented
n <- 10
C <- matrix(runif(n^2), nc=n)
(C <- C %*% t(C))
RFcovmatrix(RMfixcov(C), 1:n)


## Example 2 showing that the covariance structure is interpolated
RFcovmatrix(RMfixcov(C, 1:n), c(2, 2.1, 2.5, 3))


## Example 3 showing the use in a separable space-time model
model <- RMfixcov(C, 1:n, proj="space") * RMexp(s=40, proj="time")
(z <- RFsimulate(model, x = seq(0,12, 0.5), T=1:100))
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


