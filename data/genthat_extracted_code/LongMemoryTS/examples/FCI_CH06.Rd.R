library(LongMemoryTS)


### Name: FCI_CH06
### Title: Residual-based test for fractional cointegration (Chen, Hurvich
###   (2006))
### Aliases: FCI_CH06

### ** Examples

T<-1000
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.1,0.4), B=rbind(c(1,-1),c(0,1)))
FCI_CH06(series, diff_param=1, m_peri=25, m=floor(T^0.65))
series<-FI.sim(T=T, q=2, rho=0.4, d=c(0.4,0.4))
FCI_CH06(series, diff_param=1, m_peri=25, m=floor(T^0.65))



