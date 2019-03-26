library(intrinsicDimension)


### Name: asPointwiseEstimator
### Title: Turn a local estimator into a pointwise estimator
### Aliases: asPointwiseEstimator

### ** Examples

data <- swissRoll3Sph(300, 300) 
 # the first 300 data points are on the swiss roll (ID=2) , the last 300 on the 3-sphere (ID=3)
essPointwiseDimEst <- asPointwiseEstimator(essLocalDimEst, neighborhood.size=10,
                                           indices = c(1:10, 301:310))
ess.pw.res <- essPointwiseDimEst(data)
ess.pw.res$dim.est



