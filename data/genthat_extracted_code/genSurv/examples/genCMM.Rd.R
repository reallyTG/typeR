library(genSurv)


### Name: genCMM
### Title: Generation of Cox Markov data from an illness-death model
### Aliases: genCMM
### Keywords: datagen survival

### ** Examples

cmmdata <- genCMM( n=1000, model.cens="uniform", cens.par=2.5, beta=c(2,1,-1),
covar=10, rate=c(1,5,1,5,1,5) )
head(cmmdata, n=20L)
library(survival)
fit_13<-coxph(Surv(start,stop,event)~covariate, data=cmmdata, subset=c(trans==1))
fit_13
fit_12<-coxph(Surv(start,stop,event)~covariate, data=cmmdata, subset=c(trans==2))
fit_12
fit_23<-coxph(Surv(start,stop,event)~covariate, data=cmmdata, subset=c(trans==3))
fit_23



