library(LongMemoryTS)


### Name: FCI_CH03
### Title: Rank estimation in fractionally cointegrated systems.
### Aliases: FCI_CH03

### ** Examples

T<-1000
series<-FI.sim(T=T, q=3, rho=0.4, d=c(0.1,0.2,0.4), B=rbind(c(1,0,-1),c(0,1,-1),c(0,0,1)))
FCI_CH03(series,diff_param=1, m_peri=25, m=floor(1+T^0.65))



