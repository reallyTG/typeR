library(kza)


### Name: kzp
### Title: Kolmogorov-Zurbenko Periodogram
### Aliases: kzp smooth.kzp nonlinearity.kzp variation.kzp summary.kzp
###   plot.kzp

### ** Examples

## Not run: 
##D t<-1:6000
##D f1<-0.03
##D f2<-0.04
##D noise<-15*rnorm(length(t))
##D amp=1.5
##D s<-amp*sin(2*pi*f1*t)+amp*sin(2*pi*f2*t)
##D system.time(a<-kzp(s+noise,m=500,k=3))
##D b<-smooth.kzp(a, smooth_level=0.01)
##D par(mfrow=c(3,1))
##D plot(periodogram(s+noise),type='l')
##D plot(a)
##D plot(b)
##D par(mfrow=c(1,1))
##D 
##D # signal/noise
##D signal<-kzft(s+noise,m=500,k=3)
##D print(paste("signal-to-noise ratio = ", round(sqrt(var(2*Re(signal))/var(s+noise)),4) ))
##D 
##D summary(a, digits=2, top=2)
## End(Not run)



