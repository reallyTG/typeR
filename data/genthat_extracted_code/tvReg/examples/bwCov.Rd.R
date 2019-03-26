library(tvReg)


### Name: bwCov
### Title: Covariance Bandwidth Calculation by Cross-Validation _bwCov_
###   calculates a single bandwidth to estimate the time-varying variance-
###   covariance matrix.
### Aliases: bwCov

### ** Examples


data(CEES)
## Using a shorter set for a quick example
mydata <- tail (CEES, 50)
bw.cov <- bwCov(mydata)
Sigma.hat <- tvCov(mydata, bw = bw.cov)




