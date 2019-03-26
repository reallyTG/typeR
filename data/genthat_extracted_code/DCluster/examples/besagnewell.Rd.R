library(DCluster)


### Name: besagnewell
### Title: Besag and Newell's Statistic for Spatial Clustering
### Aliases: besagnewell
### Keywords: spatial

### ** Examples

#B&N must use the centroids as grid.
#The size of teh cluster is 20.
#100  bootstrap simulations are performed
#Poisson is the model used in the bootstrap simulations to generate the
#observations.
#Signifiance level is 0'05, even though multiple tests are made.

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

bnresults<-opgam(sids, thegrid=sids[,c("x","y")], alpha=.05, 
	iscluster=bn.iscluster, set.idxorder=TRUE, k=20, model="poisson", 
	R=100, mle=calculate.mle(sids) )

#Plot all the centroids
plot(sids$x, sids$y)

#Plot signifiant centroids in red
points(bnresults$x, bnresults$y, col="red", pch=19)



