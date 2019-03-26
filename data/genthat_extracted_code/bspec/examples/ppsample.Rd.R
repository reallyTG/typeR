library(bspec)


### Name: ppsample
### Title: Posterior predictive sampling
### Aliases: ppsample ppsample.bspec
### Keywords: ts

### ** Examples


par(mfrow=c(2,1))
plot(lh, main="'lh' data")
plot(ppsample(bspec(lh)), main="posterior predictive sample")
par(mfrow=c(1,1))



