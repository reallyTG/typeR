library(LongMemoryTS)


### Name: LPWN
### Title: Local polynomial Whittle plus noise estimator
### Aliases: LPWN

### ** Examples

library(fracdiff)
T<-2000
d<-0.2
series<-fracdiff.sim(n=T, d=d, ar=0.6)$series+rnorm(T)
LPWN(series, m=floor(1+T^0.8), R_short=1, R_noise=0)



