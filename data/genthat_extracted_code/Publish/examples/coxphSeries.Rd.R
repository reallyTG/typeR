library(Publish)


### Name: coxphSeries
### Title: Run a series of Cox regression models
### Aliases: coxphSeries

### ** Examples

library(survival)
data(pbc)
## collect hazard ratios from three univariate Cox regression analyses
pbc$edema <- factor(pbc$edema,levels=c("0","0.5","1"),labels=c("0","0.5","1"))
uni.hr <- coxphSeries(Surv(time,status==2)~1,vars=c("edema","bili","protime"),data=pbc)
uni.hr

## control the logistic regression analyses for age and gender
## but collect only information on the variables in `vars'.
controlled.hr <- coxphSeries(Surv(time,status==2)~age+sex,vars=c("edema","bili","protime"),data=pbc)
controlled.hr




