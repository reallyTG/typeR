library(JM)


### Name: summary.weibull.frailty
### Title: Summary Method for weibull.frailty Objects
### Aliases: summary.weibull.frailty
### Keywords: methods

### ** Examples

fit <- weibull.frailty(Surv(time, status) ~ age + sex, kidney)
summary(fit)
summary(fit, TRUE)



