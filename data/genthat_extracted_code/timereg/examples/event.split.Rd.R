library(timereg)


### Name: event.split
### Title: EventSplit (SurvSplit).
### Aliases: event.split
### Keywords: survival

### ** Examples


set.seed(1)
d <- data.frame(event=round(5*runif(5),2),start=1:5,time=2*1:5,
		status=rbinom(5,1,0.5),x=1:5)
d

d0 <- event.split(d,cuts="event",name.start=0)
d0

dd <- event.split(d,cuts="event")
dd
ddd <- event.split(dd,cuts=3.5)
ddd
event.split(ddd,cuts=5.5)

### successive cutting for many values 
dd <- d
for  (cuts in seq(2,3,by=0.3)) dd <- event.split(dd,cuts=cuts)
dd





