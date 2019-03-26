library(informR)


### Name: sf2nms
### Title: Translate S-form Regular Expressions
### Aliases: sf2nms

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),100))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-cbind(rawevents,actors)
evls<-gen.evl(eventlist)

sform<-"ab"
sf2nms(evls$event.key,sform)



