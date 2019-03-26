library(DCluster)


### Name: pottwhitt.boot
### Title: Bootstrap Replicates of Potthoff-Whittinghill's Statistic
### Aliases: pottwhitt.boot pottwhitt.pboot
### Keywords: htest

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

niter<-100


#Permutation model
pw.boot<-boot(sids, statistic=pottwhitt.boot, R=niter)
plot(pw.boot)#Plot results


#Multinomial model
pw.mboot<-boot(sids, statistic=pottwhitt.pboot, sim="parametric", ran.gen=multinom.sim,  R=niter)
plot(pw.mboot)#Plot results

#Poisson model
pw.pboot<-boot(sids, statistic=pottwhitt.pboot, sim="parametric", ran.gen=poisson.sim,  R=niter)
plot(pw.pboot)#Plot results

#Poisson-Gamma model
pw.pgboot<-boot(sids, statistic=pottwhitt.pboot, sim="parametric", ran.gen=negbin.sim, R=niter)
plot(pw.pgboot)#Plot results




