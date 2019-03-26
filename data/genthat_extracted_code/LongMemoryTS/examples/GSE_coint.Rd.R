library(LongMemoryTS)


### Name: GSE_coint
### Title: Multivariate local Whittle estimation of long memory parameters
###   and cointegrating vector.
### Aliases: GSE_coint

### ** Examples

#
# Cointegration:
#
T<-500
m<-floor(T^0.75)
series<-FI.sim(T=T,q=2,rho=0,d=c(0.1,0.4), B=rbind(c(1,-1),c(0,1)))
ts.plot(series, col=1:2)
GSE_coint(X=series,m=m, elements=c(1,2))



