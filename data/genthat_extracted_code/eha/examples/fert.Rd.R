library(eha)


### Name: fert
### Title: Marital fertility nineteenth century
### Aliases: fert
### Keywords: datasets

### ** Examples

data(fert)
fit <- coxreg(Surv(next.ivl, event) ~ ses + prev.ivl, data = fert, subset =
(parity == 1))
drop1(fit, test = "Chisq")



