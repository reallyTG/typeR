library(relsurv)


### Name: rs.br
### Title: Test the Proportional Hazards Assumption for Relative Survival
###   Regression Models
### Aliases: rs.br plot.rs.br print.rs.br
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
fit <- rsadd(Surv(time,cens)~sex,rmap=list(age=age*365.241),
		ratetable=slopop,data=rdata,int=5)
rsbr <- rs.br(fit)
rsbr
plot(rsbr)



