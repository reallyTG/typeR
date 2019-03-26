library(bdpv)


### Name: nNPVPPV
### Title: Asymptotic experimental design for inference on negative and
###   positive predictive values in case-control studies.
### Aliases: nNPVPPV nNPV nPPV AOppvnpv
### Keywords: htest

### ** Examples


 nPPV(propP=c(0.2,0.4,0.6,0.8), se=0.9, sp=0.9,
 prev=0.1, PPV0=0.4, conf.level=0.95, power=0.8)

 nNPV(propP=c(0.2,0.4,0.6,0.8), se=0.9, sp=0.9,
 prev=0.1, NPV0=0.95, conf.level=0.95, power=0.8)

 AOppvnpv(se=0.9, sp=0.9)



