library(DCluster)


### Name: gearyc.stat
### Title: Compute Geary's C Autocorrelation Statistic
### Aliases: gearyc.stat gearyc.test
### Keywords: spatial

### ** Examples

library(spdep)
data(nc.sids)
col.W <- nb2listw(ncCR85.nb, zero.policy=TRUE)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))

gearyc.stat(data=sids, listw=col.W, n=length(ncCR85.nb), n1=length(ncCR85.nb)-1,
	S0=Szero(col.W) )

gearyc.stat(data=sids, applyto="SMR", listw=col.W, n=length(ncCR85.nb), 
	n1=length(ncCR85.nb)-1,S0=Szero(col.W) )

gearyc.test(Observed~offset(log(Expected)), data=sids, model="poisson", R=99,
   applyto="SMR", listw=col.W, n=length(ncCR85.nb), 
	n1=length(ncCR85.nb)-1,S0=Szero(col.W) )



