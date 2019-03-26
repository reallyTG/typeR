library(informR)


### Name: informR-package
### Title: R Tools for Creating Sequence Statistics
### Aliases: informR-package informR
### Keywords: package

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)

#See event-type alphabetic token codes
eventlist$event.key

alpha.ints<-gen.intercepts(eventlist,basecat="ran")

#Create some inertial s-form statistics and fit the models
beta.sforms<-gen.sformlist(eventlist,c("aa","bb","cc","dd"))

#Combine s-form matrices with intercepts
beta.ints<-slbind(beta.sforms,alpha.ints,new.names=TRUE,event.key=eventlist$event.key)
fitalpha.rem<-rem(eventlist=eventlist$eventlist,statslist=alpha.ints,estimator="BPM")
fitbeta.rem<-rem(eventlist=eventlist$eventlist,statslist=beta.ints,estimator="BPM")
summary(fitalpha.rem)
summary(fitbeta.rem)

for(i in c("aa","bb","cc","dd")) count.sform(eventlist,i)



