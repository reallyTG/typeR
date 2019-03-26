library(LongMemoryTS)


### Name: FDLS
### Title: Narrow band estimation of the cointegrating vector.
### Aliases: FDLS

### ** Examples

T<-500
d<-0.4
beta<-1

data<-FI.sim(T, q=2, rho=0, d=c(d,0))
xt<-data[,1]
et<-data[,2]
yt<-beta*xt+et
FDLS(xt,yt,m=floor(1+T^0.4))

data<-FI.sim(T, q=2, rho=0.8, d=c(d,0))
xt<-data[,1]
et<-data[,2]
yt<-beta*xt+et
FDLS(xt,yt,m=floor(1+T^0.4))



