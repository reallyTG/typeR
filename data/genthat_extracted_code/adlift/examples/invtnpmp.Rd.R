library(adlift)


### Name: invtnpmp
### Title: invtnpmp
### Aliases: invtnpmp
### Keywords: methods

### ** Examples

#read in multiple point data...

data(motorcycledata)
times<-motorcycledata$time
accel<-motorcycledata$accel
shortf<-adjustx(times,accel)$sepf

out<-fwtnpmp(times,accel,LocalPred=CubicPredmp,neighbours=2)

inv<-invtnpmp(times, out$coefflist, out$coeff, out$lengths, out$lengthsremove, out$pointsin,
out$removelist,out$neighbrs,out$newneighbrs,out$schemehist,out$interhist, neighbours = 2,
LocalPred = CubicPredmp)

sum(abs(shortf-inv$coeff)) 



