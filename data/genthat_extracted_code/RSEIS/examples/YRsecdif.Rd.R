library(RSEIS)


### Name: YRsecdif
### Title: Return difference in seconds
### Aliases: YRsecdif YRsecdifL
### Keywords: misc

### ** Examples



T1  <-  list(jd=12, hr=13, mi=23, sec=21, yr=1964 )
T2  <-  list(jd=14, hr=23, mi=23, sec=2, yr=1976)

YRsecdif(T1$jd, T1$hr, T1$mi, T1$sec,  T2$jd, T2$hr, T2$mi, T2$sec,
1964, 1976)

####  or

YRsecdifL(T1, T2)




