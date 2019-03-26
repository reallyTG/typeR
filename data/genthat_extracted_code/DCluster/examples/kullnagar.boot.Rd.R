library(DCluster)


### Name: kullnagar.boot
### Title: Generate Bootstrap Replicates of Kulldorff and Nagarwalla's
###   Statistic
### Aliases: kullnagar.boot kullnagar.pboot
### Keywords: spatial

### ** Examples

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, Population=nc.sids$BIR74, x=nc.sids$x, y=nc.sids$y)

niter<-100

#Permutation  model
kn.perboot<-boot(sids, statistic=kullnagar.boot, R=niter, fractpop=.2)
plot(kn.perboot)#Display results

#Multinomial model
kn.mboot<-boot(sids, statistic=kullnagar.pboot, sim="parametric", 
	ran.gen=multinom.sim,  R=niter, fractpop=.2)
plot(kn.mboot)#Display results

#Poisson model
kn.pboot<-boot(sids, statistic=kullnagar.pboot, sim="parametric", 
	ran.gen=poisson.sim,  R=niter, fractpop=.2)
plot(kn.pboot)#Display results

#Poisson-Gamma model
kn.pgboot<-boot(sids, statistic=kullnagar.pboot, sim="parametric", 
	ran.gen=negbin.sim, R=niter, fractpop=.2)
plot(kn.pgboot)#Display results





