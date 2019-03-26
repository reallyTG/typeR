library(eha)


### Name: infants
### Title: Infant mortality and maternal death, Sweeden 1821-1894.
### Aliases: infants
### Keywords: datasets

### ** Examples

data(infants)
fit <- coxreg(Surv(enter, exit, event) ~ strata(stratum) + mother, data
= infants)
fit
fit.w <- phreg(Surv(enter, exit, event) ~ mother + parish + ses, data =
infants)
fit.w ## Weibull proportional hazards model.



