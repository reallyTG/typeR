library(DCluster)


### Name: besagnewell.boot
### Title: Generate Boostrap Replicates of Besag and Newell's Statistic
### Aliases: besagnewell.boot besagnewell.pboot
### Keywords: spatial

### ** Examples

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

niter<-100

#Permutation  model
besn.perboot<-boot(sids, statistic=besagnewell.boot, R=niter, k=20)
plot(besn.perboot)#Display results



