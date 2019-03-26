library(DCluster)


### Name: achisq.boot
### Title: Bootstrap Replicates of Pearson's Chi-square Statistic
### Aliases: achisq.boot achisq.pboot
### Keywords: htest

### ** Examples

library(boot)
library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))

niter<-100

#Permutation  model
chq.perboot<-boot(sids, statistic=achisq.boot, R=niter)
plot(chq.perboot)#Display results

#Multinomial model
chq.mboot<-boot(sids, statistic=achisq.pboot, sim="parametric", ran.gen=multinom.sim,  R=niter)
plot(chq.mboot)#Display results

#Poisson model
chq.pboot<-boot(sids, statistic=achisq.pboot, sim="parametric", ran.gen=poisson.sim,  R=niter)
plot(chq.pboot)#Display results

#Poisson-Gamma model
chq.pgboot<-boot(sids, statistic=achisq.pboot, sim="parametric", ran.gen=negbin.sim, R=niter)
plot(chq.pgboot)#Display results



