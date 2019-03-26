library(informR)


### Name: count.sform
### Title: Count Sform Instances
### Aliases: count.sform

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),100))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-cbind(rawevents,actors)
evls<-gen.evl(eventlist)

sform<-"ab"
count.sform(evls,sform)
count.sform(evls,sform)$Bill

#Compare with
count.sform(evls,sform,new.name=FALSE)



