library(DCluster)


### Name: pottwhitt.stat
### Title: Compute Potthoff-Whittinghill's Statistic
### Aliases: pottwhitt.stat pottwhitt.test
### Keywords: htest

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

pottwhitt.stat(sids)

pottwhitt.test(Observed~offset(log(Expected)),sids, model="poisson", R=99)



