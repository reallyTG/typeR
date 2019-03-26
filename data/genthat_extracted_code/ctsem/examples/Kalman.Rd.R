library(ctsem)


### Name: Kalman
### Title: Kalman
### Aliases: Kalman

### ** Examples

### ctstantestfit is a dummy ctStanFit object with 2 manifest indicators,
###  4 latents, and 1 time dependent predictor.

### get parameter matrices
kpars <- ctStanContinuousPars(ctstantestfit)

#construct dummy data
datalong <- cbind(0:9, 1, matrix(rnorm(20,2,1),ncol=2))
datalong[c(1:3,9:10),3:4]<-NA #missing data to pre/fore cast
colnames(datalong) <- c('time', 'id', paste0('Y',1:2))
print(datalong)

#obtain Kalman filtered estimates
kout <- Kalman(kpars=kpars, datalong=datalong,
  manifestNames=paste0('Y',1:nrow(kpars$MANIFESTMEANS)),
  latentNames=paste0('eta',1:nrow(kpars$DRIFT)))

#print and plot smoothed estimates (conditional on all states) of indicators.
print(kout$ysmooth)
matplot(kout$time,kout$ysmooth,type='l')
matplot(kout$time,datalong[,3:4],type='p',add=TRUE,pch=1)



