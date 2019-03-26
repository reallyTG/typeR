library(coxphw)


### Name: coxphw
### Title: Weighted Estimation in Cox Regression
### Aliases: coxphw
### Keywords: survival regression

### ** Examples

data("gastric")

# weighted estimation of average hazard ratio
fit1 <- coxphw(Surv(time, status) ~ radiation, data = gastric, template = "AHR")
summary(fit1)
fit1$cov.lw     # robust covariance
fit1$cov.ls     # Lin-Sasieni covariance


# unweighted estimation, include interaction with years
# ('radiation' must be included in formula!)
gastric$years <- gastric$time / 365.25
fit2 <- coxphw(Surv(years, status) ~ radiation + years : radiation, data = gastric,
               template = "PH")
summary(fit2)


# unweighted estimation with a function of time
data("gastric")
gastric$yrs <- gastric$time / 365.25

fun <- function(t) { (t > 1) * 1 }
fit3 <- coxphw(Surv(yrs, status) ~ radiation + fun(yrs):radiation, data = gastric,
               template = "PH")

# for more examples see vignette or predict.coxphw



