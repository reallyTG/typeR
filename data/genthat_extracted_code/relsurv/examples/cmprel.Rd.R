library(relsurv)


### Name: cmp.rel
### Title: Compute crude probability of death
### Aliases: cmp.rel print.cmp.rel
### Keywords: survival

### ** Examples


data(slopop)
data(rdata)
#calculate the crude probability of death
#note that the variable year must be given in a date format and that 
#age must be multiplied by 365.241 in order to be expressed in days.
fit <- cmp.rel(Surv(time,cens)~sex,rmap=list(age=age*365.241),
		ratetable=slopop,data=rdata,tau=3652.41)
fit
plot(fit,col=c(1,1,2,2),xscale=365.241,xlab="Time (years)")
#if no strata are desired:
fit <- cmp.rel(Surv(time,cens)~1,rmap=list(age=age*365.241),
		ratetable=slopop,data=rdata,tau=3652.41)





