library(LongMemoryTS)


### Name: local.W
### Title: Local Whittle estimator of fractional difference parameter d.
### Aliases: local.W

### ** Examples

library(fracdiff)
T<-1000
d<-0.4
series<-fracdiff.sim(n=T, d=d)$series
local.W(series,m=floor(1+T^0.65))



