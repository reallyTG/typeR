library(DCluster)


### Name: lognormalEB
### Title: Empirical Bayes Smoothing Using a log-Normal Model
### Aliases: lognormalEB
### Keywords: models

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))

smth<-lognormalEB(sids$Observed, sids$Expected)



