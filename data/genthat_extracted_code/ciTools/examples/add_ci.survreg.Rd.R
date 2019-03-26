library(ciTools)


### Name: add_ci.survreg
### Title: Confidence Intervals for the Mean Survival Time of Accelerated
###   Failure Time Models.
### Aliases: add_ci.survreg

### ** Examples

## Define a data set.
tb <- survival::stanford2
## remove a covariate with missing values.
tb <- tb[, 1:4]
## next, create the Surv object inside the survreg call:
fit <- survival::survreg(survival::Surv(time, status) ~ age + I(age^2),
                         data = tb, dist = "lognormal")
add_ci(tb, fit, alpha = 0.1, names = c("lwr", "upr"))

## Try a different model:
fit2 <- survival::survreg(survival::Surv(time, status) ~ age + I(age^2),
                          data = tb, dist = "weibull")
add_ci(tb, fit2, alpha = 0.1, names = c("lwr", "upr"))




