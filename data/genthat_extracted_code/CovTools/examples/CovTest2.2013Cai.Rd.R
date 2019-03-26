library(CovTools)


### Name: CovTest2.2013Cai
### Title: Two-Sample Covariance Test by Cai and Ma (2013)
### Aliases: CovTest2.2013Cai

### ** Examples

## generate 2 datasets from multivariate normal with identical covariance.
data1 = mvtnorm::rmvnorm(100, sigma=diag(5))
data2 = mvtnorm::rmvnorm(200, sigma=diag(5))

## run test
CovTest2.2013Cai(data1, data2)




