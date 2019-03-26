library(DCluster)


### Name: besagnewell.stat
### Title: Besag and Newell's Statistic for Spatial Clustering
### Aliases: besagnewell.stat
### Keywords: spatial

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

besagnewell.stat(sids, k=20)



