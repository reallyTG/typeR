library(fishmethods)


### Name: clus.mean
### Title: Estimation of Population Attributes and Effective Sample Size
###   for Fishes Collected Via Cluster Sampling
### Aliases: clus.mean
### Keywords: misc

### ** Examples

data(codcluslen)
temp<-codcluslen[codcluslen$region=="NorthCape" & codcluslen$number>0,]
temp$station<-c(paste(temp$region,"-",temp$tow,sep=""))
total<-aggregate(temp$number,list(temp$station),sum)
names(total)<-c("station","total")
temp<-merge(temp,total,by.x="station",by.y="station")
newdata<-data.frame(NULL)
for(i in 1:as.numeric(length(temp[,1]))){
  for(j in 1:temp$number[i]){
    newdata<-rbind(newdata,temp[i,])
  }
}
clus.mean(popchar=newdata$length,cluster=newdata$station,
         clustotal=newdata$total)



