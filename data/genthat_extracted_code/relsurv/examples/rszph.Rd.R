library(relsurv)


### Name: rs.zph
### Title: Behaviour of Covariates in Time for Relative Survival Regression
###   Models
### Aliases: rs.zph
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
fit <- rsadd(Surv(time,cens)~sex,rmap=list(age=age*365.241),
	ratetable=slopop,data=rdata,int=5)
rszph <- rs.zph(fit)
plot(rszph)



