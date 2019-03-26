library(DCluster)


### Name: whittermore.boot
### Title: Generate Bootstrap Replicates of Whittermore's Statistic
### Aliases: whittermore.boot whittermore.pboot
### Keywords: spatial

### ** Examples

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74) )
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

#Calculate neighbours based on distance
coords<-as.matrix(sids[,c("x", "y")])

dlist<-dnearneigh(coords, 0, Inf)
dlist<-include.self(dlist)
dlist.d<-nbdists(dlist, coords)

#Calculate weights. They are globally standardised but it doesn't
#change significance.
col.W.whitt<-nb2listw(dlist, glist=dlist.d, style="C")

niter<-100

#Permutation model
wt.boot<-boot(sids, statistic=whittermore.boot, R=niter, listw=col.W.whitt,
	zero.policy=TRUE)
plot(wt.boot)#Display results

#Multinomial model
wt.mboot<-boot(sids, statistic=whittermore.pboot, sim="parametric", 
	ran.gen=multinom.sim,  R=niter,  listw=col.W.whitt, zero.policy=TRUE)
		
plot(wt.mboot)#Display results

#Poisson model
wt.pboot<-boot(sids, statistic=whittermore.pboot, sim="parametric", 
	ran.gen=poisson.sim,  R=niter,  listw=col.W.whitt, zero.policy=TRUE)
		
plot(wt.pboot)#Display results

#Poisson-Gamma model
wt.pgboot<-boot(sids, statistic=whittermore.pboot, sim="parametric", 
	ran.gen=negbin.sim, R=niter, listw=col.W.whitt, zero.policy=TRUE)
plot(wt.pgboot)#Display results



