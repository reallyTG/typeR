library(DCluster)


### Name: empbaysmooth
### Title: Empirical Bayes Smoothing
### Aliases: empbaysmooth
### Keywords: models

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))

smth<-empbaysmooth(sids$Observed, sids$Expected)



