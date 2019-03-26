library(NPHazardRate)


### Name: HazardHistogram
### Title: Histogram Hazard Rate Estimator
### Aliases: HazardHistogram

### ** Examples

SampleSize <-400
ti<-rweibull(SampleSize,0.5,0.8)
xout<-seq(0.02, 3.5, length=80)
true.hazard<-dweibull(xout,0.5, 0.8)/(1-pweibull(xout, 0.5, 0.8))
cen<-rep.int(1, SampleSize)
cen[sample(1:SampleSize, SampleSize/10)]<-0

band<-nlminb(start= 2, obj=cvfunction, control = list(iter.max = 100, x.tol = .001)
            ,xin=ti, xout= xout, cens = cen, 	lower=.01, upper=max(xout))
bin<- 3.49 * sd(ti)^2 * SampleSize^(-1/3) /50 #Scott 1979 Biometrika default rule
bin<-unlist(band[1])
histest<- HazardHistogram(ti,xout, cen, bin+0.013 )

plot(xout, true.hazard, type="l")
lines(histest[,1], histest[,2], col=2, type="s")
barplot( histest[,2], rep(bin, times=length(histest[,2])))
lines(xout, true.hazard, type="l", lwd=2, col=2)



