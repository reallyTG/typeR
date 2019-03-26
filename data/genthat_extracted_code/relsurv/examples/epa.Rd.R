library(relsurv)


### Name: epa
### Title: Excess hazard function smoothing
### Aliases: epa
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#fit an additive model with the EM method
fit <- rsadd(Surv(time,cens)~sex+age,rmap=list(age=age*365.241),
		ratetable=slopop,data=rdata,int=5,method="EM")
sm <- epa(fit)
plot(sm$times,sm$lambda)



