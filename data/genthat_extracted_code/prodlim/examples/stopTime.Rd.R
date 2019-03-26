library(prodlim)


### Name: stopTime
### Title: Stop the time of an event history object
### Aliases: stopTime

### ** Examples


set.seed(29)
d <- SimSurv(10)
h <- with(d,Hist(time,status))
h
stopTime(h,8)
stopTime(h,5)

## works also with Surv objects
library(survival)
s <- with(d,Surv(time,status))
stopTime(s,5)

## competing risks
set.seed(29)
dr <- SimCompRisk(10)
hr <- with(dr,Hist(time,event))
hr
stopTime(hr,8)
stopTime(hr,5)




