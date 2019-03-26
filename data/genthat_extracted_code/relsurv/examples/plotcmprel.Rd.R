library(relsurv)


### Name: plot.cmp.rel
### Title: Plot the crude probability of death
### Aliases: plot.cmp.rel
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
fit <- cmp.rel(Surv(time,cens)~sex,rmap=list(age=age*365.241),
		ratetable=slopop,data=rdata,tau=3652.41)
plot(fit,col=c(1,1,2,2),xscale=365.241,conf.int=c(1,3))



