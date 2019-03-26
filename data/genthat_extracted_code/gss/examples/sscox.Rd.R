library(gss)


### Name: sscox
### Title: Estimating Relative Risk Using Smoothing Splines
### Aliases: sscox
### Keywords: smooth models survival

### ** Examples

## Relative Risk
data(stan)
fit.rr <- sscox(Surv(futime,status)~age,data=stan)
est.rr <- predict(fit.rr,data.frame(age=c(35,40)),se=TRUE)
## Base Hazard
risk <- predict(fit.rr,stan)
fit.bh <- sshzd(Surv(futime,status)~futime,data=stan,offset=log(risk))
tt <- seq(0,max(stan$futime),length=51)
est.bh <- hzdcurve.sshzd(fit.bh,tt,se=TRUE)
## Clean up
## Not run: rm(stan,fit.rr,est.rr,risk,fit.bh,tt,est.bh)



