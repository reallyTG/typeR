library(informR)


### Name: slbind.cond
### Title: Add ActorXEvent Conditional or Interaction Variables to a
###   Statslist Array
### Aliases: slbind.cond

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)
beta.ints<-gen.intercepts(eventlist)


statslist.new<-slbind.cond(intvar=c(1,0,0),beta.ints,var.suffix="Jim")
statslist.new[[1]][[1]][1,,]
statslist.new[[2]][[1]][1,,]
statslist.new[[3]][[1]][1,,]



