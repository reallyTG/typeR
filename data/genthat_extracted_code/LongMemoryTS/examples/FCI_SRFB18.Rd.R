library(LongMemoryTS)


### Name: FCI_SRFB18
### Title: Frequency-domain test for fractional cointegration (Souza,
###   Reise, Franco, Bondon (2018))
### Aliases: FCI_SRFB18

### ** Examples

T<-1000
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.1,0.7), B=rbind(c(1,-1),c(0,1)))
FCI_SRFB18(series, d=0.7, m=floor(T^0.75), r=1)
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.4,0.4))
FCI_SRFB18(series, d=0.4, m=floor(T^0.75), r=1)



