library(FitAR)


### Name: Boot.FitAR
### Title: Simulate a Fitted AR
### Aliases: Boot.FitAR
### Keywords: ts

### ** Examples

#Plot log(lynx) time series and simulation
#
ans <- FitAR(log(lynx), 8)
z<-Boot.FitAR(ans)
par(mfrow=c(2,1))
TimeSeriesPlot(log(lynx))
title(main="log(lynx) time series")
TimeSeriesPlot(z)
title(main="Simulated AR(8), fitted to log lynx")
#par(mfrow=c(1,1)
#
#Use bootstrap to compute standard errors of parameters
#takes about 18 seconds on a 3.6 GHz PC

## Not run: 
##D ptm <- proc.time() #user time
##D R<-100  #number of bootstrap iterations
##D p<-c(1,2,4,7,10,11)
##D ans<-FitAR(log(lynx),p)
##D out<-Boot(ans, R)
##D fn<-function(z) GetFitARz(z,p)$zetaHat
##D sdBoot<-sqrt(diag(var(t(apply(out,fn,MARGIN=2)))))
##D sdLargeSample<-coef(ans)[,2][1:6]
##D sd<-matrix(c(sdBoot,sdLargeSample),ncol=2)
##D dimnames(sd)<-list(names(sdLargeSample),c("Bootstrap","LargeSample"))
##D ptm<-(proc.time()-ptm)[1]
##D sd
## End(Not run)



