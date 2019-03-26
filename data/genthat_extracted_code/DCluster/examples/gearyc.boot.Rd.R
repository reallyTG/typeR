library(DCluster)


### Name: gearyc.boot
### Title: Generate Bootstrap Replicates of Geary's C Autocorrelation
###   Statistic
### Aliases: gearyc.boot gearyc.pboot
### Keywords: spatial

### ** Examples

library(boot)
library(spdep)

data(nc.sids)
col.W <- nb2listw(ncCR85.nb, zero.policy=TRUE)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))


niter<-100

#Permutation model
gc.perboot<-boot(sids, statistic=gearyc.boot, R=niter, listw=col.W,
	n=length(ncCR85.nb), n1=length(ncCR85.nb)-1, S0=Szero(col.W) )
plot(gc.perboot)#Display results

#Multinomial model
gc.mboot<-boot(sids, statistic=gearyc.pboot, sim="parametric", 
	ran.gen=multinom.sim, R=niter, listw=col.W,
        n=length(ncCR85.nb), n1=length(ncCR85.nb)-1, S0=Szero(col.W) )
plot(gc.mboot)#Display results

#Poisson model
gc.pboot<-boot(sids, statistic=gearyc.pboot, sim="parametric", 
	ran.gen=poisson.sim, R=niter, listw=col.W,
	n=length(ncCR85.nb), n1=length(ncCR85.nb)-1, S0=Szero(col.W) )
plot(gc.pboot)#Display results

#Poisson-Gamma model
gc.pgboot<-boot(sids, statistic=gearyc.pboot, sim="parametric", 
	ran.gen=negbin.sim, R=niter, listw=col.W,
	n=length(ncCR85.nb), n1=length(ncCR85.nb)-1, S0=Szero(col.W) )
plot(gc.pgboot)#Display results




