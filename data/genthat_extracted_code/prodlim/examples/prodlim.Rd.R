library(prodlim)


### Name: prodlim
### Title: Functions for estimating probabilities from right censored data
### Aliases: prodlim prodlim-package prodlim
### Keywords: cluster nonparametric survival

### ** Examples


##---------------------two-state survival model------------
dat <- SimSurv(30)
with(dat,plot(Hist(time,status)))
fit <- prodlim(Hist(time,status)~1,data=dat)
print(fit)
plot(fit)
summary(fit)
quantile(fit)

## Subset
fit1a <- prodlim(Hist(time,status)~1,data=dat,subset=dat$X1==1)
fit1b <- prodlim(Hist(time,status)~1,data=dat,subset=dat$X1==1 & dat$X2>0)

## --------------------clustered data---------------------
library(survival)
cdat <- cbind(SimSurv(30),patnr=sample(1:5,size=30,replace=TRUE))
fit <- prodlim(Hist(time,status)~cluster(patnr),data=cdat)
print(fit)
plot(fit)
summary(fit)


##-----------compare Kaplan-Meier to survival package---------

dat <- SimSurv(30)
pfit <- prodlim(Surv(time,status)~1,data=dat)
pfit <- prodlim(Hist(time,status)~1,data=dat) ## same thing
sfit <- survfit(Surv(time,status)~1,data=dat,conf.type="plain")
##  same result for the survival distribution function 
all(round(pfit$surv,12)==round(sfit$surv,12))
summary(pfit,digits=3)
summary(sfit,times=quantile(unique(dat$time)))

##-----------estimating the censoring survival function----------------

rdat <- data.frame(time=c(1,2,3,3,3,4,5,5,6,7),status=c(1,0,0,1,0,1,0,1,1,0))
rpfit <- prodlim(Hist(time,status)~1,data=rdat,reverse=TRUE)
rsfit <- survfit(Surv(time,1-status)~1,data=rdat,conf.type="plain")
## When there are ties between times at which events are observed
## times at which subjects are right censored, then the convention
## is that events come first. This is not obeyed by the above call to survfit,
## and hence only prodlim delivers the correct reverse Kaplan-Meier:
cbind("Wrong:"=rsfit$surv,"Correct:"=rpfit$surv)

##-------------------stratified Kaplan-Meier---------------------

pfit.X2 <- prodlim(Surv(time,status)~X2,data=dat)
summary(pfit.X2)
summary(pfit.X2,intervals=TRUE)
plot(pfit.X2)

##----------continuous covariate: Stone-Beran estimate------------

prodlim(Surv(time,status)~X1,data=dat)

##-------------both discrete and continuous covariates------------

prodlim(Surv(time,status)~X2+X1,data=dat)

##----------------------interval censored data----------------------

dat <- data.frame(L=1:10,R=c(2,3,12,8,9,10,7,12,12,12),status=c(1,1,0,1,1,1,1,0,0,0))
with(dat,Hist(time=list(L,R),event=status))

dat$event=1
npmle.fitml <- prodlim(Hist(time=list(L,R),event)~1,data=dat)

##-------------competing risks-------------------

CompRiskFrame <- data.frame(time=1:100,event=rbinom(100,2,.5),X=rbinom(100,1,.5))
crFit <- prodlim(Hist(time,event)~X,data=CompRiskFrame)
summary(crFit)
plot(crFit)
summary(crFit,cause=2)
plot(crFit,cause=2)


# Changing the cens.code:
dat <- data.frame(time=1:10,status=c(1,2,1,2,5,5,1,1,2,2))
fit <- prodlim(Hist(time,status)~1,data=dat)
print(fit$model.response)
fit <- prodlim(Hist(time,status,cens.code="2")~1,data=dat)
print(fit$model.response)
plot(fit)
plot(fit,cause="5")


##------------delayed entry----------------------

## left-truncated event times with competing risk endpoint 

dat <- data.frame(entry=c(7,3,11,12,11,2,1,7,15,17,3),time=10:20,status=c(1,0,2,2,0,0,1,2,0,2,0))
fitd <- prodlim(Hist(time=time,event=status,entry=entry)~1,data=dat)
summary(fitd)
plot(fitd)




