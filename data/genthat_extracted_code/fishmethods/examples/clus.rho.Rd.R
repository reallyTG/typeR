library(fishmethods)


### Name: clus.rho
### Title: Intracluster Correlation Coefficients for Clustered Data
### Aliases: clus.rho
### Keywords: misc

### ** Examples

  data(codcluslen)
  tem<-codcluslen[codcluslen[,1]=="NorthCape" & codcluslen[,3]>0,]
  outs<-data.frame(tow=NA,len=NA)
  cnt<-0
  for(i in 1:as.numeric(length(tem$number))){
    for(j in 1:tem$number[i]){
     cnt<-cnt+1
     outs[cnt,1]<-tem$tow[i]
     outs[cnt,2]<-tem$length[i]
   }
 }
 clus.rho(popchar=outs$len,cluster=outs$tow)


