library(optband)


### Name: surv.range
### Title: Evaluate whether times are in an interval
### Aliases: surv.range
### Keywords: internal

### ** Examples

library(survival)
fit <- survfit(Surv(stop, event) ~ 1, data=bladder)
summary(fit)
surv.range(fit, .1, .9)




