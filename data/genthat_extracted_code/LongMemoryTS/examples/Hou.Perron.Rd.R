library(LongMemoryTS)


### Name: Hou.Perron
### Title: Modified local Whittle estimator of fractional difference
###   parameter d.
### Aliases: Hou.Perron

### ** Examples

library(fracdiff)
T<-1000
d<-0
mean<-c(rep(0,T/2),rep(2,T/2))
FI<-fracdiff.sim(n=T, d=d)$series
series<-mean+FI
ts.plot(series)
lines(mean, col=2)
local.W(series, m=floor(1+T^0.65))
Hou.Perron(series, m=floor(1+T^0.65))



