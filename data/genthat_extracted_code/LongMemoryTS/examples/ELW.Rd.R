library(LongMemoryTS)


### Name: ELW
### Title: Exact local Whittle estimator of the fractional difference
###   parameter d for stationary and non-stationary long memory.
### Aliases: ELW

### ** Examples

library(fracdiff)
T<-1000
d<-0.8
series<-cumsum(fracdiff.sim(T,d=(d-1))$series)
ts.plot(series)
ELW(series, m=floor(1+T^0.7))$d



