library(CliftLRD)


### Name: liftHurstC
### Title: Performs (non-decimated) complex-valued lifting based estimation
###   of the Hurst exponent of a real-valued time series
### Aliases: liftHurstC
### Keywords: manip regression ts

### ** Examples


library(fracdiff)

# simulate a long range dependent time series, and fake missingness
x<-fracdiff.sim(n = 200, d = 0.3)$series

missing<-sample(1:200,70,FALSE)
timeindex<-setdiff(1:200,missing)

Hestx<-liftHurstC(x[timeindex],grid=timeindex,ntraj=25)




