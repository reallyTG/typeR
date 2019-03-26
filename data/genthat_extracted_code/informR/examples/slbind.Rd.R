library(informR)


### Name: slbind
### Title: Combine Statlist Arrays
### Aliases: slbind

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)
beta.ints<-gen.intercepts(eventlist)
beta.sforms<-gen.sformlist(eventlist,c("a+b","bb"))
statslist<-slbind(beta.sforms,beta.ints)
statslist[[1]][[1]][1:3,,]

#Compare with:
statslist<-slbind(beta.sforms,beta.ints,new.names=TRUE,event.key=eventlist$event.key)
dimnames(statslist[[1]][[1]])



