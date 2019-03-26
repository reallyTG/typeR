library(DCluster)


### Name: kullnagar.stat
### Title: Kulldorff and Nagarwalla's Statistic for Spatial Clustering.
### Aliases: kullnagar.stat kullnagar.stat.poisson kullnagar.stat.bern
### Keywords: spatial

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, Population=nc.sids$BIR74, x=nc.sids$x, y=nc.sids$y)


dist<-(sids$x-sids$x[1])^2+(sids$y-sids$y[1])^2
index<-order(dist)
#Compute the statistic around the first county
kullnagar.stat(sids[index,], fractpop=.5)



