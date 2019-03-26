library(RSEIS)


### Name: recdate
### Title: Rectify Date
### Aliases: recdate recdatel
### Keywords: misc

### ** Examples


recdate(76, 23, 22, yr=2000)

###########  example spanning leap year
##  start on Day 1, but subtract 36 hours and proceed to plus 36 hours
hrs <- seq(from=-36, to=36, by=2)
rd <- recdate(jd=1, hr=hrs, mi=34,
       sec=23+runif(n=length(hrs), 0, 59) , yr=2009)
write.table(data.frame(rd))

###########  example spanning non-leap year
rd2 <- recdate(jd=1, hr=hrs, mi=34,
     sec=23+runif(n=length(hrs), 0, 59) , yr=2008)
write.table(data.frame(rd2))





