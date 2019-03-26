library(DCluster)


### Name: achisq.stat
### Title: Another Implementation of Pearson's Chi-square Statistic
### Aliases: achisq.stat achisq.test
### Keywords: htest

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))

#Compute the statistic under the assumption that lambda = 1.
achisq.stat(sids, lambda=1)

#Perform test
achisq.test(Observed~offset(log(Expected)), sids, model="poisson", R=99)



