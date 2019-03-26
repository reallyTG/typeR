library(oce)


### Name: decimate
### Title: Smooth and Decimate, or Subsample, an Oce Object
### Aliases: decimate

### ** Examples

library(oce)
data(adp)
plot(adp)
adpDec <- decimate(adp,by=2,filter=c(1/4, 1/2, 1/4))
plot(adpDec)



