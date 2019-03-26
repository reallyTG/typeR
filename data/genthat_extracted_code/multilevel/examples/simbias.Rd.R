library(multilevel)


### Name: simbias
### Title: Simulate Standard Error Bias in Non-Independent Data
### Aliases: simbias
### Keywords: datagen

### ** Examples


library(nlme)
set.seed(15)
SIM.OUTPUT<-simbias(corr=.15,gsize=10,ngrp=50,icc1x=0.05,
            icc1y=0.35, nrep=100)
apply(SIM.OUTPUT,2,mean)
1-pnorm(1.96-3.39) #Power of the lme model (two-tailed, alpha=.05)
1-pnorm(1.96-2.95) #Power of the OLS model (two-tailed, alpha=.05)




