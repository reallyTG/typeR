library(LongMemoryTS)


### Name: FCI_WWC15
### Title: Semiparametric test for fractional cointegration (Wang, Wang,
###   Chan (2015))
### Aliases: FCI_WWC15

### ** Examples

T<-1000
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.1,0.8), B=rbind(c(1,1),c(0,1)))
FCI_WWC15(series,  m=floor(1+T^0.65))
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.8,0.8))
FCI_WWC15(series,  m=floor(1+T^0.65))



