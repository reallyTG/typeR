library(iMediate)


### Name: delta.lnl
### Title: Estimates in Linear M-model and Linear Y-model with Delta Method
### Aliases: delta.lnl
### Keywords: estimates

### ** Examples


data("jobs", package = "mediation")

fit.M <- lm(job_seek ~ treat + econ_hard + sex + age, data=jobs)
fit.Y <- lm(depress2 ~ treat + job_seek + econ_hard + sex + age, data=jobs)
delta.lnl(fit.M, fit.Y, rho=0.2)


fit.M <- lm(job_seek ~ treat + econ_hard + sex + age , data=jobs)
fit.Y <- lm(depress2 ~ treat*job_seek+ econ_hard + sex + age , data=jobs)
delta.lnl(fit.M, fit.Y, rho=0.5)




