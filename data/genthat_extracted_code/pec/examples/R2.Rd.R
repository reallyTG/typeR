library(pec)


### Name: R2
### Title: Explained variation for survival models
### Aliases: R2
### Keywords: survival

### ** Examples


set.seed(18713)
library(prodlim)
library(survival)
dat=SimSurv(100)
nullmodel=prodlim(Hist(time,status)~1,data=dat)
pmodel1=coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE)
pmodel2=coxph(Surv(time,status)~X2,data=dat,x=TRUE,y=TRUE)
perror=pec(list(Cox1=pmodel1,Cox2=pmodel2),Hist(time,status)~1,data=dat,reference=TRUE)
R2(perror,times=seq(0,1,.1),reference=1)




