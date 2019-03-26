library(adlift)


### Name: denoiseheteromp
### Title: denoiseheteromp
### Aliases: denoiseheteromp
### Keywords: smooth regression

### ** Examples

data(motorcycledata)
#
times<-motorcycledata$time
accel<-motorcycledata$accel



est1<-denoiseheteromp(times,accel,AdaptNeighmp,1,TRUE,TRUE,2,
"median","ave")
#
#the estimate of the underlying curve. 





