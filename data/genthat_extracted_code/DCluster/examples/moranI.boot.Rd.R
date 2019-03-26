library(DCluster)


### Name: moranI.boot
### Title: Generate Bootstrap Replicates of Moran's I Autocorrelation
###   Statistic
### Aliases: moranI.boot moranI.pboot
### Keywords: spatial

### ** Examples

library(spdep)
data(nc.sids)
col.W <- nb2listw(ncCR85.nb, zero.policy=TRUE)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74)) 

niter<-100

#Permutation model
moran.boot<-boot(sids, statistic=moranI.boot, R=niter, listw=col.W, 
	n=length(ncCR85.nb), S0=Szero(col.W) )
plot(moran.boot)#Display results

#Multinomial model
moran.mboot<-boot(sids, statistic=moranI.pboot, sim="parametric", 
	ran.gen=multinom.sim,  R=niter, listw=col.W,n=length(ncCR85.nb), 
	S0=Szero(col.W) )
plot(moran.mboot)#Display results

#Poisson model
moran.pboot<-boot(sids, statistic=moranI.pboot, sim="parametric", 
	ran.gen=poisson.sim,  R=niter, listw=col.W,n=length(ncCR85.nb),
	S0=Szero(col.W) )
		
plot(moran.pboot)#Display results

#Poisson-Gamma model
moran.pgboot<-boot(sids, statistic=moranI.pboot, sim="parametric", 
	ran.gen=negbin.sim, R=niter,  listw=col.W,n=length(ncCR85.nb),
	S0=Szero(col.W) )
		
plot(moran.pgboot)#Display results



