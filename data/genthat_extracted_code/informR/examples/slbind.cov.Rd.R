library(informR)


### Name: slbind.cov
### Title: Add Covariates to a Statslist Array
### Aliases: slbind.cov

### ** Examples

rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)
beta.ints<-gen.intercepts(eventlist)

##Make up some covariates
covar<-list()
covar$Bill$rate<-sort(rexp(length(eventlist$eventlist$Bill)))
covar$Bill$smokes<-1
covar$Jim$rate<-sort(rexp(length(eventlist$eventlist$Jim)))
covar$Jim$smokes<-0
covar$Pete$rate<-sort(rexp(length(eventlist$eventlist$Pete)))
covar$Pete$smokes<-0

statslist.new<-slbind.cov(covar,beta.ints)
statslist.new[[1]][[1]][,1,]



