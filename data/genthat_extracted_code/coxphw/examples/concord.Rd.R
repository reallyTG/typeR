library(coxphw)


### Name: concord
### Title: Compute Generalized Concordance Probabilities for Objects of
###   Class 'coxphw' or 'coxph'
### Aliases: concord
### Keywords: survival

### ** Examples

data("gastric")
fit <- coxphw(Surv(time, status) ~ radiation, data = gastric, template = "AHR")
concord(fit)



