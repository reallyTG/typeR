library(mets)


### Name: logitSurv
### Title: Proportional odds survival model
### Aliases: logitSurv

### ** Examples

data(TRACE)
dcut(TRACE) <- ~.
out1 <- logitSurv(Surv(time,status==9)~vf+chf+strata(wmicat.4),data=TRACE)
summary(out1)
gof(out1)
bplot(out1)




