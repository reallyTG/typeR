library(bdpv)


### Name: simPVmat
### Title: Simulate performance of confidence intervals for predictive
###   values in case-control design
### Aliases: simPVmat
### Keywords: htest

### ** Examples


simPVmat(se=0.8, sp=0.95, pr=1/16,
 n1=c(177, 181), n0=c(554, 87), NPV0=0.98, PPV0=c(0.4, 0.25))


simPVmat(se=0.8, sp=0.95, pr=c(0.05,0.0625, 0.075, 0.1),
 n1=177, n0=554, NPV0=0.98, PPV0=0.4)






