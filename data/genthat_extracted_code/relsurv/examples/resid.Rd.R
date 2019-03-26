library(relsurv)


### Name: residuals.rsadd
### Title: Calculate Residuals for a "rsadd" Fit
### Aliases: residuals.rsadd
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
fit <- rsadd(Surv(time,cens)~sex,rmap=list(age=age*365.241),
       ratetable=slopop,data=rdata,int=5)
sresid <- residuals.rsadd(fit)



