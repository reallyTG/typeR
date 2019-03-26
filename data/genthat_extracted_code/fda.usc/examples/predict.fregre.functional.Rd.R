library(fda.usc)


### Name: predict.functional.response
### Title: Predict method for functional response model
### Aliases: predict.fregre.fr
### Keywords: regression

### ** Examples

## Not run: 
##D 
##D # CV prediction for CandianWeather data
##D rtt<-c(0, 365)
##D basiss  <- create.bspline.basis(rtt,7)
##D basist  <- create.bspline.basis(rtt,9)
##D nam<-dimnames(CanadianWeather$dailyAv)[[2]]
##D 
##D # fdata class (raw data)
##D tt<-1:365
##D tempfdata<-fdata(t(CanadianWeather$dailyAv[,,1]),tt,rtt)
##D log10precfdata<-fdata(t(CanadianWeather$dailyAv[,,3]),tt,rtt)
##D rng<-range(log10precfdata) 
##D for (ind in 1:35){
##D  res1<-  fregre.basis.fr(tempfdata[-ind], log10precfdata[-ind],
##D  basis.s=basiss,basis.t=basist)
##D  pred1<-predict.fregre.fr(res1,tempfdata[ind])
##D  plot( log10precfdata[ind],col=1,ylim=rng,main=nam[ind])
##D  lines(pred1,lty=2,col=2)
##D  Sys.sleep(1)
##D }
##D 
##D # fd class  (smooth data)
##D basis.alpha  <- create.constant.basis(rtt)
##D basisx  <- create.bspline.basis(rtt,65)
##D 
##D dayfd<-Data2fd(day.5,CanadianWeather$dailyAv,basisx)
##D tempfd<-dayfd[,1]
##D log10precfd<-dayfd[,3]
##D for (ind in 1:35){
##D  res2 <-  fregre.basis.fr(tempfd[-ind], log10precfd[-ind],
##D  basis.s=basiss,basis.t=basist)
##D  pred2<-predict.fregre.fr(res2,tempfd[ind])
##D  plot(log10precfd[ind],col=1,ylim=range(log10precfd$coef),main=nam[ind]) 
##D  lines(pred2,lty=2,col=2)
##D  Sys.sleep(1)
##D }
## End(Not run)



