library(LongMemoryTS)


### Name: FCI_NS07
### Title: Rank estimation in fractionally cointegrated systems by Nielsen,
###   Shimotsu (2007).
### Aliases: FCI_NS07

### ** Examples

T<-1000
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.1,0.4), B=rbind(c(1,-1),c(0,1)))
FCI_NS07(series, m1=floor(1+T^0.75), m=floor(1+T^0.65))
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.9,0.9))
FCI_NS07(series, m1=floor(1+T^0.75), m=floor(1+T^0.65))



