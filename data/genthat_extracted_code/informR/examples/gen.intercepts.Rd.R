library(informR)


### Name: gen.intercepts
### Title: Generate Baserate Statistics
### Aliases: gen.intercepts gen.baserates

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),5))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-gen.evl(cbind(rawevents,actors))
baserates<-gen.intercepts(eventlist)
baserates[[1]][[1]][1,,]

#Compare with:
baserates<-gen.intercepts(eventlist,contr=FALSE)
baserates[[1]][[1]][1,,]



