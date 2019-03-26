library(tsDyn)


### Name: MakeThSpec
### Title: Specification of the threshold search
### Aliases: MakeThSpec makeThSpec

### ** Examples


sun<-(sqrt(sunspot.year+1)-1)*2		
selectSETAR(sun, m=3, th=MakeThSpec(exact=10.40967),criterion="SSR", d=1, thDelay=0:2,
           plot=FALSE, nthresh=1)
#when pre-sepcified value does not correspond, function will search nearest value
selectSETAR(sun, m=3, th=MakeThSpec(exact=10.4),criterion="SSR", d=1, thDelay=0:2,
           plot=FALSE, nthresh=1)
#search around:
selectSETAR(sun, m=3, th=MakeThSpec(around=10.40967, ngrid=20),criterion="SSR", d=1, thDelay=0:2,
           plot=FALSE, nthresh=1)
#search in an interval
selectSETAR(sun, m=3, th=MakeThSpec(int=c(10, 11), ngrid=20),criterion="SSR", d=1, thDelay=0:2,
           plot=FALSE, nthresh=1)
#reduce size of the grid:
selectSETAR(sun, m=3, th=MakeThSpec(ngrid="Half"),criterion="SSR", d=1, thDelay=0:2,
           plot=FALSE, nthresh=1)


# 2 thresholds:
selectSETAR(sun, m=3, th=MakeThSpec(ngrid="Half"),criterion="SSR", d=1, thDelay=0:2,
           plot=FALSE, nthresh=2)





