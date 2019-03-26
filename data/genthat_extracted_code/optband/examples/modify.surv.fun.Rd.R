library(optband)


### Name: modify.surv.fun
### Title: Truncate 'survfit' object
### Aliases: modify.surv.fun
### Keywords: internal

### ** Examples

library(survival)
fit <- survfit(Surv(stop, event) ~ 1, data=bladder)
fit2 <- modify.surv.fun(fit, .1, .9)




