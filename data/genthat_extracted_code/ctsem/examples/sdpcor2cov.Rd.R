library(ctsem)


### Name: sdpcor2cov
### Title: sdcor2cov
### Aliases: sdpcor2cov

### ** Examples

testmat <- diag(exp(rnorm(5,-3,2)),5) #generate arbitrary std deviations
testmat[row(testmat) > col(testmat)] <- runif((5^2-5)/2, -1, 1) 
print(testmat)
covmat <- sdpcor2cov(testmat) #convert to covariance
cov2cor(covmat) #convert covariance to correlation



