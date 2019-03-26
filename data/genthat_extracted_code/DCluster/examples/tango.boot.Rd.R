library(DCluster)


### Name: tango.boot
### Title: Generate Bootstrap Replicated of Tango's Statistic
### Aliases: tango.boot tango.pboot
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
col.W.tango<-nb2listw(dlist, glist=lapply(dlist.d, function(x) {exp(-x)}),
        style="C")
	
niter<-100


#Permutation model
tn.boot<-boot(sids, statistic=tango.boot, R=niter, listw=col.W.tango, 
	zero.policy=TRUE)
plot(tn.boot)#Display results

#Multinomial model
tn.mboot<-boot(sids, statistic=tango.pboot, sim="parametric", 
	ran.gen=multinom.sim,  R=niter, listw=col.W.tango, zero.policy=TRUE)
		
plot(tn.mboot)#Display results

#Poisson model
tn.pboot<-boot(sids, statistic=tango.pboot, sim="parametric", 
	ran.gen=poisson.sim,  R=niter, listw=col.W.tango, zero.policy=TRUE)
		
plot(tn.pboot)#Display results

#Poisson-Gamma model
tn.pgboot<-boot(sids, statistic=tango.pboot, sim="parametric", 
	ran.gen=negbin.sim, R=niter, listw=col.W.tango, zero.policy=TRUE)
plot(tn.pgboot)#Display results



