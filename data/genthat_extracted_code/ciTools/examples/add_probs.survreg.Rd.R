library(ciTools)


### Name: add_probs.survreg
### Title: Confidence Intervals for the Survivor Function of Accelerated
###   Failure Time Models
### Aliases: add_probs.survreg

### ** Examples

## Define a data set.
tb <- survival::stanford2
## remove a covariate with missing values.
tb <- tb[, 1:4]
## next, create the Surv object inside the survreg call:
fit <- survival::survreg(survival::Surv(time, status) ~ age + I(age^2),
                         data = tb, dist = "lognormal")
## Calculate the level 0.75 quantile wit CIs for that quantile
add_probs(tb, fit, q = 500, name = c("Fhat", "lwr", "upr"))

## Try a weibull model for the same data:
fit2 <- survival::survreg(survival::Surv(time, status) ~ age + I(age^2),
                          data = tb, dist = "weibull")
## Calculate the level 0.75 quantile with CIs for the quantile
add_probs(tb, fit2, q = 500, name = c("Fhat", "lwr", "upr"))





