library(gamlss.cens)


### Name: gamlss.cens-package
### Title: Fitting an Interval Response Variable Using 'gamlss.family'
###   Distributions
### Aliases: gamlss.cens-package gamlss.cens
### Keywords: package

### ** Examples

library(survival)
library(gamlss)
library(gamlss.dist)
# comparing results with package survival
# fitting the exponential distribution
ms1<-survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, 
             dist='exponential')
mg1<-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
             family=cens(EXP),c.crit=0.00001)
if(abs(-2*ms1$loglik[2]-deviance(mg1))>0.001) stop(paste("descrepancies in exp")) 
if(sum(coef(ms1)-coef(mg1))>0.001) warning(paste("descrepancies in coef in exp")) 
summary(ms1)
summary(mg1)
# fitting the Weibull distribution
ms2 <-survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='weibull')
mg2 <-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
           family=cens(WEI, delta=c(0.001,0.001)), c.crit=0.00001)
if(abs(-2*ms2$loglik[2]-deviance(mg2))>0.005) 
     stop(paste("descrepancies in deviance in WEI")) 
summary(ms2);summary(mg2)
# compare the scale parameter
 1/exp(coef(mg2,"sigma"))
# now fit the Weibull in different parameterrazions  
mg21<-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
             family=cens(WEI2), method=mixed(2,30)) 
mg21<-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
             family=cens(WEI3)) 



