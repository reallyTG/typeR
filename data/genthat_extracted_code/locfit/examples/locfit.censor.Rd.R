library(locfit)


### Name: locfit.censor
### Title: Censored Local Regression
### Aliases: locfit.censor
### Keywords: smooth

### ** Examples

data(heart, package="locfit")
fit <- locfit.censor(log10(surv+0.5) ~ age, cens=cens, data=heart)
## Can also be written as:
## Not run: fit <- locfit(log10(surv + 0.5) ~ age, cens=cens, data=heart, lfproc=locfit.censor)
with(heart, plotbyfactor(age, 0.5 + surv, cens, ylim=c(0.5, 16000), log="y"))
lines(fit, tr=function(x) 10^x)



