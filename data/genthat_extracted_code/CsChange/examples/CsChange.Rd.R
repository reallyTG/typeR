library(CsChange)


### Name: CsChange
### Title: Testing for Change in C-Statistic
### Aliases: CsChange

### ** Examples

require("rms")
set.seed(123)
n=50
age=50+12*rnorm(n)
sex=factor(sample(c('Male','Female'), n,rep=TRUE, prob=c(.6, .4)))
cens=15*runif(n)
h=.02*exp(.04*(age-50)+.8*(sex=='Female'))
dt=-log(runif(n))/h
e=ifelse(dt <= cens,1,0)
dt=pmin(dt, cens)
units(dt)="Year"
data=data.frame(dt=dt,e=e,dt1=dt,dt2=dt,e1=e,e2=e,age,sex)
dd=datadist(age, sex)
options(datadist='dd')

#for 'cph' model
fit1=cph(Surv(dt,e)~age,data)
fit2=cph(Surv(dt,e)~age+sex,data)
CsChange(fit1,fit2,data=data,nb=20)

#for 'coxph' model
fit1=coxph(Surv(dt,e)~age,data)
fit2=coxph(Surv(dt,e)~age+sex,data)
CsChange(fit1,fit2,data=data,nb=20)

#for 'coxph' model
#fit1=coxph(Surv(dt1,e1)~age,data)
#fit2=coxph(Surv(dt2,e2)~age+sex,data)
#CsChange(fit1,fit2,data=data,nb=20)

#for 'coxph' model
#fit1=coxph(Surv(dt,e)~age+sex,data)
#fit2=coxph(Surv(dt,e)~rcs(age)+sex,data)
#CsChange(fit1,fit2,data=data,nb=20)#ignore the warnings messages



