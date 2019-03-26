library(LongMemoryTS)


### Name: ELW2S
### Title: Two-Step Exact local Whittle estimator of fractional integration
###   with unknown mean and time trend.
### Aliases: ELW2S

### ** Examples

library(fracdiff)
T<-1000
d<-0.8
trend<-(1:T)/T
series<-cumsum(fracdiff.sim(T,d=(d-1))$series)
ts.plot(series)
ELW2S(series, m=floor(1+T^0.7), trend_order=0)$d
series2<-series+2*trend
ELW2S(series2, m=floor(1+T^0.7), trend_order=1)$d
series3<-series+2*trend+2*trend^2
ELW2S(series3, m=floor(1+T^0.7), trend_order=2)$d



