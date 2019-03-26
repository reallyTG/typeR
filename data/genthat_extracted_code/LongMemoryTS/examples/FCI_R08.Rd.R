library(LongMemoryTS)


### Name: FCI_R08
### Title: Hausman-type test for fractional cointegration (Robinson (2008))
### Aliases: FCI_R08

### ** Examples

T<-1000
series<-FI.sim(T=T, q=2, rho=0.9, d=c(0.1,0.4), B=rbind(c(1,-1),c(0,1)))
FCI_R08(series, m=floor(T^0.75), type="*")
series<-FI.sim(T=T, q=2, rho=0.9, d=c(0.4,0.4))
FCI_R08(series,  m=floor(T^0.75), type="*")



