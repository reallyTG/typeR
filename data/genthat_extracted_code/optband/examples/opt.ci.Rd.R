library(optband)


### Name: opt.ci
### Title: Confidence bands optimized by area
### Aliases: opt.ci

### ** Examples

library(survival)
# fit and plot a Kaplan-Meier curve
fit <- survfit(Surv(stop, event) ~ 1, data=bladder)
plot(fit)
fit2 <- opt.ci(fit)
plot(fit2)




