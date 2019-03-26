library(DCluster)


### Name: Tests for Overdispertion
### Title: Likelihood Ratio Test and Dean's Tests for Overdispertion
### Aliases: test.nb.pois DeanB DeanB2
### Keywords: htest

### ** Examples

library(spdep)
library(MASS)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

x.glm<-glm(Observed~1+offset(log(sids$Expected)), data=sids, family=poisson())
x.nb<-glm.nb(Observed~1+offset(log(Expected)), data=sids)

print(test.nb.pois(x.nb, x.glm))
print(DeanB(x.glm))
print(DeanB2(x.glm))




