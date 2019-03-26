library(optband)


### Name: cumhaz.var
### Title: Variance of the cumulative-hazard function
### Aliases: cumhaz.var
### Keywords: internal

### ** Examples


library(survival)
fit <- survfit(Surv(stop, event) ~ 1, data=bladder)
cumhaz.var(fit)




