library(genSurv)


### Name: genTDCM
### Title: Generating data from a Cox model with time-dependent covariates
### Aliases: genTDCM
### Keywords: datagen survival

### ** Examples

tdcmdata <- genTDCM(n=1000, dist="weibull", corr=0.8, dist.par=c(2,3,2,3),
model.cens="uniform", cens.par=2.5, beta=c(-3.3,4), lambda=1)
head(tdcmdata, n=20L)
library(survival)
fit1<-coxph(Surv(start,stop,event)~tdcov+covariate,data=tdcmdata)
summary(fit1)

tdcmdata2 <- genTDCM(n=1000, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=0.5)
head(tdcmdata2, n=20L)
fit2<-coxph(Surv(start,stop,event)~tdcov+covariate,data=tdcmdata2)
summary(fit2)



