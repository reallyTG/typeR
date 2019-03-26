library(fishmethods)


### Name: clus.rho.g
### Title: Calculate A Common Intracluster Correlation Coefficient Among
###   Groups
### Aliases: clus.rho.g
### Keywords: misc

### ** Examples

  data(codcluslen)
   temp<-codcluslen[codcluslen$number>0,]
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
  newdata<-newdata[,-c(5)]
 clus.rho.g(popchar=newdata$length,cluster=newdata$station,group=newdata$region)



