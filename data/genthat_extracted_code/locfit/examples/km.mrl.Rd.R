library(locfit)


### Name: km.mrl
### Title: Mean Residual Life using Kaplan-Meier estimate
### Aliases: km.mrl
### Keywords: smooth

### ** Examples

# censored regression using the Kaplan-Meier estimate.
data(heart, package="locfit")
fit <- locfit.censor(log10(surv+0.5)~age, cens=cens, data=heart, km=TRUE)
plotbyfactor(heart$age, 0.5+heart$surv, heart$cens, ylim=c(0.5,16000), log="y")
lines(fit, tr=function(x)10^x)



