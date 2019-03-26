library(km.ci)


### Name: km.ci
### Title: Confidence intervals for the Kaplan-Meier estimator.
### Aliases: km.ci
### Keywords: survival

### ** Examples

require(survival)
data(rectum.dat)

# fit a Kaplan-Meier and plot it
fit <- survfit(Surv(time, status) ~ 1, data=rectum.dat)
plot(fit)
fit2 <- km.ci(fit)
plot(fit2)



