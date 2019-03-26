library(RSEIS)


### Name: showdatetime
### Title: Print Date/TIME
### Aliases: showdatetime
### Keywords: misc

### ** Examples

hrs <- seq(from=-36, to=36, by=2)

rd <- recdate(jd=1, hr=hrs, mi=34,
         sec=23+runif(n=length(hrs), 0, 59) , yr=2009)

showdatetime(rd)

showdatetime(rd, AMPM=TRUE)





