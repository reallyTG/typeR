library(DCluster)


### Name: moranI.stat
### Title: Compute Moran's I Autocorrelation Statistic
### Aliases: moranI.stat moranI.test
### Keywords: spatial

### ** Examples

library(spdep)
data(nc.sids)
col.W <- nb2listw(ncCR85.nb, zero.policy=TRUE)


sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74) )

moranI.stat(data=sids, listw=col.W, n=length(ncCR85.nb), S0=Szero(col.W) )

moranI.stat(data=sids, applyto="residuals", listw=col.W, n=length(ncCR85.nb), 
	S0=Szero(col.W) )

moranI.test(Observed~offset(log(Expected)), sids, model="poisson", R=99,
   listw=col.W, n=length(ncCR85.nb), S0=Szero(col.W) )




