library(LongMemoryTS)


### Name: cross.Peri
### Title: Cross periodogram of vector valued time series X and Y
### Aliases: cross.Peri

### ** Examples

T<-500
d<-c(0.4, 0.2, 0.3)
data<-FI.sim(T, q=3, rho=0, d=d)
X<-data[,1:2]
Y<-data[,3]
cper<-cross.Peri(X, Y)
pmax<-max(Re(cper),Im(cper))
pmin<-min(Re(cper),Im(cper))
plot(Re(cper[1,,]), type="h", ylim=c(pmin,pmax))
lines(Im(cper[1,,]), col=2)
plot(Re(cper[2,,]), type="h", ylim=c(pmin,pmax))
lines(Im(cper[2,,]), col=2)



