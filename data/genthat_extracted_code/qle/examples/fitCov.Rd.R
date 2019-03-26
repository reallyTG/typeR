library(qle)


### Name: fitCov
### Title: Covariance parameter estimation
### Aliases: fitCov

### ** Examples

data(normal)  

# fit 1st statistic and get REML results
fitCov(qsd$covT[1],
       Xs=as.matrix(qsd$qldata[1:2]),
       data=qsd$qldata["mean.T1"],verbose=TRUE)
  



