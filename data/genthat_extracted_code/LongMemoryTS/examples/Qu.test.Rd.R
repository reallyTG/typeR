library(LongMemoryTS)


### Name: Qu.test
### Title: Qu test for true long memory against spurious long memory.
### Aliases: Qu.test

### ** Examples

library(fracdiff)
T<-500
m<-floor(1+T^0.75)
series<-fracdiff.sim(n=T,d=0.4)$series
shift.series<-ARRLS.sim(T=500,phi=0.5, sig.shift=0.75, prob=5/T, sig.noise=1)
ts.plot(series, ylim=c(min(min(series),min(shift.series)),max(max(series),max(shift.series))))
lines(shift.series, col=2)
Qu.test(series,m=m, epsilon=0.05)
Qu.test(shift.series,m=m, epsilon=0.05)



