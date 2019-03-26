library(LongMemoryTS)


### Name: FCI_N10
### Title: Nonparametric test for fractional cointegration (Nielsen (2010))
### Aliases: FCI_N10

### ** Examples

T<-1000
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.1,0.9), B=rbind(c(1,-1),c(0,1)))
FCI_N10(series, m=floor(T^0.75), type="test")
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.9,0.9))
FCI_N10(series, m=floor(T^0.75), type="test")
series<-FI.sim(T=T, q=3, rho=0.4, d=c(0.2,0.2,1), B=rbind(c(1,-0.5,-0.3),c(0,1,-0.4),c(0,0,1)))
FCI_N10(series,m=floor(T^0.75),type="rank")



