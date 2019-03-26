library(DCluster)


### Name: bn.iscluster
### Title: Clustering Function for Besag and Newell's Method
### Aliases: bn.iscluster
### Keywords: spatial

### ** Examples

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

#B&N's method
bnresults<-opgam(data=sids, thegrid=sids[,c("x","y")], alpha=.05, 
	iscluster=bn.iscluster, k=20, R=100, model="poisson", 
	mle=calculate.mle(sids))

#Plot all centroids and significant ones in red
plot(sids$x, sids$y, main="Besag & Newell's method")
points(bnresults$x, bnresults$y, col="red", pch=19)



