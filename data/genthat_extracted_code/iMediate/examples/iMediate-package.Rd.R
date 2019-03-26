library(iMediate)


### Name: iMediate-package
### Title: Likelihood Methods for Statistical Mediation Analysis
### Aliases: iMediate-package iMediate

### ** Examples


data("jobs", package = "mediation")

fit.M <- lm(job_seek ~ treat + econ_hard + sex + age, data=jobs)
fit.Y <- lm(depress2 ~ treat * job_seek + econ_hard + sex + age, data=jobs)
mdn(fit.M, fit.Y, "treat")




