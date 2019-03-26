library(relsurv)


### Name: survfit.rsadd
### Title: Compute a Predicited Survival Curve
### Aliases: survfit.rsadd
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#BTW: work on a smaller dataset here to run the example faster
fit <- rsadd(Surv(time,cens)~sex,rmap=list(age=age*365.241),
	ratetable=slopop,data=rdata[1:500,],method="EM")
survfit.rsadd(fit,newdata=data.frame(sex=1,age=60,year=17000))




