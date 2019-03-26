library(informR)


### Name: gen.sformlist
### Title: Generate a list of S-form sequence statistics.
### Aliases: gen.sformlist

### ** Examples

set.seed(57391)
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)

#See event-type alphabetic token codes
eventlist$event.key

alpha.ints<-gen.intercepts(eventlist,basecat="ran")

#Create some inertial s-form statistics and fit the models
beta.sforms<-gen.sformlist(eventlist,c("aa","bb","cc","dd"))

#Condition out the effects of the prefix:
gamma.sforms<-gen.sformlist(eventlist,c("aab","abb","acc","add"),cond=TRUE)

#Manual example of the above
sforms1<-c("aab","abb","acc","add")
sforms2<-sapply(sforms1,function(x) substr(x,1,nchar(x)-1))

sforms1.sf<-gen.sformlist(eventlist, sforms1)
sforms2.sf<-gen.sformlist(eventlist, sforms2)

for(i in 1:length(sforms1.sf)){
   for(j in 1: dim(sforms1.sf[[1]])[[3]]){
      sforms1.sf[[i]][,,j]<-abs(sforms1.sf[[i]][,,j]-sforms2.sf[[i]][,,j])
   }
}

#Note the difference:
gamma.sforms2<-gen.sformlist(eventlist,c("aab","abb","acc","add"))
gamma.sforms2[[1]][75:85,,1]
gamma.sforms[[1]][75:85,,1]



