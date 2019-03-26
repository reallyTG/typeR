library(beadarrayMSV)


### Name: findSeTheta
### Title: Scale pooled standard errors after polar transformation
### Aliases: findSeTheta

### ** Examples

#A single standard error value for points of increasing intensity
R <- .1:10
pooledSE.raw <- 1
pooledSE.theta <- findSeTheta(pooledSE.raw=pooledSE.raw,R=R)
print(pooledSE.theta)



