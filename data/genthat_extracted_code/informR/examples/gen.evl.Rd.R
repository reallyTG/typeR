library(informR)


### Name: gen.evl
### Title: Generate numeric categories of events.
### Aliases: gen.evl

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),100))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-cbind(rawevents,actors)
evls<-gen.evl(eventlist)
evls$eventlist$Bill
evls$event.key

#Compare with:
evls<-gen.evl(eventlist,null.events=c("ran","eat"))
evls$eventlist$Bill
evls$event.key
evls$null.events



