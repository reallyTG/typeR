library(adlift)


### Name: fwtnpmp
### Title: fwtnpmp
### Aliases: fwtnpmp
### Keywords: methods

### ** Examples

#read in multiple point data...

data(motorcycledata)
times<-motorcycledata$time
accel<-motorcycledata$accel

out<-fwtnpmp(times,accel,LocalPred=AdaptPredmp,neighbours=2)
out$coeff

#these are the detail coefficients of the transform.




