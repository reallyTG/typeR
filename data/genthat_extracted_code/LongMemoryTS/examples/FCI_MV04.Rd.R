library(LongMemoryTS)


### Name: FCI_MV04
### Title: Test for fractional cointegration (Marmol, Velasco (2004))
### Aliases: FCI_MV04

### ** Examples

T<-500
series<-FI.sim(T=T, q=2, rho=0.1, d=c(0.6,1), B=rbind(c(1,-1),c(0,1)))
FCI_MV04(series, type="const", N=floor(T^(0.75)), m=floor(T^(2/3)))
series<-FI.sim(T=T, q=2, rho=0.1, d=c(0.8,0.8))
FCI_MV04(series, type="const", N=floor(T^(0.75)), m=floor(T^(2/3)))



