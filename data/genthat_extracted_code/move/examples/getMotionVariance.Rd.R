library(move)


### Name: getMotionVariance
### Title: Extracts the estimated motion variance
### Aliases: getMotionVariance getMotionVariance,DBBMM-method
###   getMotionVariance,DBBMMBurstStack-method
###   getMotionVariance,DBBMMStack-method
###   getMotionVariance,dBGBvarianceTmp-method
###   getMotionVariance,dBMvarianceStack-method
###   getMotionVariance,dBMvarianceTmp-method
###   getMotionVariance,dBMvarianceBurst-method
###   getMotionVariance,dynBGB-method

### ** Examples

data(leroydbbmm)
data(dbbmmstack)
getMotionVariance(leroydbbmm)[1:50] ## with a DBBMM object
str(getMotionVariance(dbbmmstack)) ## with a DBBMMStack object



