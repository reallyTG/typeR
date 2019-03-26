library(DCluster)


### Name: kn.iscluster
### Title: Clustering Function for Kulldorff and Nagarwalla's Statistic
### Aliases: kn.iscluster kn.gumbel.iscluster
### Keywords: spatial

### ** Examples

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, Population=nc.sids$BIR74, x=nc.sids$x, y=nc.sids$y)

#K&N's method over the centroids
mle<-calculate.mle(sids, model="poisson")
knresults<-opgam(data=sids, thegrid=sids[,c("x","y")], alpha=.05, 
  iscluster=kn.iscluster, fractpop=.5, R=100, model="poisson", mle=mle)

kngumbelres<-opgam(data=sids, thegrid=sids[,c("x","y")], alpha=.05, 
  iscluster=kn.gumbel.iscluster, fractpop=.5, R=100, model="poisson", 
  mle=mle)

#Plot all centroids and significant ones in red
plot(sids$x, sids$y, main="Kulldorff and Nagarwalla's method")
points(knresults$x, knresults$y, col="red", pch=19)
points(knresults$x, knresults$y, col="blue", pch=20)



