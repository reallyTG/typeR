library(LongMemoryTS)


### Name: FCI_ZRY18
### Title: Rank estimation in fractionally cointegrated systems (Zhang,
###   Robinson, Yao (2018))
### Aliases: FCI_ZRY18

### ** Examples

T<-1000
series<-FI.sim(T=T, q=3, rho=0.4, d=c(0.2,0.2,1), B=rbind(c(1,0,-1),c(0,1,-1),c(0,0,1)))
FCI_ZRY18(series, lag_max=5, lag_max2=20, c0=0.3) 
series<-FI.sim(T=T, q=3, rho=0.4, d=c(1,1,1))
FCI_ZRY18(series, lag_max=5, lag_max2=20, c0=0.3) 



