library(DCluster)


### Name: stone.stat
### Title: Compute Stone's Statistic
### Aliases: stone.stat stone.test
### Keywords: spatial

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

#Compute Stone's statistic around Anson county
region<-which(row.names(nc.sids)=="Robeson")
stone.stat(sids, region=region, lambda=1)


stone.test(Observed~offset(log(Expected)), sids, model="poisson", R=99, 
   region=region, lambda=1)



