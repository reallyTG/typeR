library(SPREDA)


### Name: Lifedata.MLE
### Title: Parametric Fitting for Lifetime Data
### Aliases: Lifedata.MLE miniusloglik.ce.xt.lev miniusloglik.ce.xt.logis
###   miniusloglik.ce.xt.norm miniusloglik.ce.xt.sev miniusloglik.lev.wts
###   miniusloglik.sev.wts miniusloglik.normal.wts miniusloglik.logis.wts
###   print.Lifedata.MLE coef.Lifedata.MLE logLik.Lifedata.MLE

### ** Examples

#################################################################
### right censored data
data(shock)
res1=Lifedata.MLE(Surv(Distance, Censor)~1, data=shock, dist="weibull")
res1
summary(res1)

res2=Lifedata.MLE(Surv(Distance, Censor)~1, data=shock, dist="lognormal")
res2
summary(res2)

#################################################################
### left truncated right censoring data
data(testdata)
test=Lifedata.MLE(Surv(truncation.age, age, failure)~1, data=testdata,dist="weibull", 
method="Nelder-Mead", subset=(group=="MC_Old"))
summary(test)  


#################################################################
### dynamix covariates
data(Prod2.xt.dat)
data(Prod2.fai.dat)

## No test: 
test=Lifedata.MLE(Surv(failure.time, delta)~1, data=Prod2.fai.dat,xt.dat=Prod2.xt.dat,
starts=c(12, 3.5, log(2)), dist="weibull")
summary(test)
## End(No test)



