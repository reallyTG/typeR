library(LongMemoryTS)


### Name: FMNBLS
### Title: Fully Modified Narrow Band Least Squares (FMNBLS) estimation of
###   the cointegrating vector.
### Aliases: FMNBLS

### ** Examples

T<-500
d<-0.4
beta<-1

m0<-m3<-floor(T^0.4)                        
m1<-floor(T^0.6)                       
m2<-floor(T^0.8)

data<-FI.sim(T, q=2, rho=0.8, d=c(d,0))
xt<-data[,1]
et<-data[,2]
yt<-beta*xt+et
FDLS(xt,yt,m=m0)
FMNBLS(xt,yt,m0=m0, m1=m1, m2=m2, m3=m3)



