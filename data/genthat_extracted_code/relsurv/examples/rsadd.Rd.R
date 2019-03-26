library(relsurv)


### Name: rsadd
### Title: Fit an Additive model for Relative Survival
### Aliases: rsadd
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#fit an additive model
#note that the variable year is given in days since 01.01.1960 and that
#age must be multiplied by 365.241 in order to be expressed in days.
fit <- rsadd(Surv(time,cens)~sex+as.factor(agegr)+ratetable(age=age*365.241),
	    ratetable=slopop,data=rdata,int=5)

#check the goodness of fit
rs.br(fit)

#use the EM method and plot the smoothed baseline excess hazard
fit <- rsadd(Surv(time,cens)~sex+age,rmap=list(age=age*365.241),
	 ratetable=slopop,data=rdata,int=5,method="EM")
sm <- epa(fit)
plot(sm$times,sm$lambda,type="l")



