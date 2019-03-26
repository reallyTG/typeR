library(eha)


### Name: phreg
### Title: Parametric Proportional Hazards Regression
### Aliases: phreg
### Keywords: regression survival

### ** Examples


data(mort)
fit <- phreg(Surv(enter, exit, event) ~ ses, data = mort)
fit
plot(fit)
fit.cr <- coxreg(Surv(enter, exit, event) ~ ses, data = mort)
check.dist(fit.cr, fit)




