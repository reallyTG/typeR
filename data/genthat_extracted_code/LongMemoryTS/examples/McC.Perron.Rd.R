library(LongMemoryTS)


### Name: McC.Perron
### Title: GPH estimation of long memory parameter robust to low frequency
###   contaminations.
### Aliases: McC.Perron

### ** Examples

library(fracdiff)
T<-1000
m<-floor(1+T^0.8)
d=0.4
series<-fracdiff.sim(n=T, d=d)$series
McC.Perron(series,m)



