library(LongMemoryTS)


### Name: gph
### Title: GPH estimator of fractional difference parameter d.
### Aliases: gph

### ** Examples

library(fracdiff)
T<-500
m<-floor(1+T^0.8)
d=0.4
series<-fracdiff.sim(n=T, d=d)$series
gph(X=series,m=m)



