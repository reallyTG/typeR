library(iMediate)


### Name: fimle.lnl
### Title: Full Information Maximum Likelihood Estimates in Linear M-model
###   and Linear Y-model
### Aliases: fimle.lnl
### Keywords: estimates

### ** Examples


data("jobs", package = "mediation")

fit.M <- lm(job_seek ~ treat + econ_hard + sex + age, data=jobs)
fit.Y <- lm(depress2 ~ treat + job_seek + econ_hard + sex + age, data=jobs)
fimle.lnl(fit.M, fit.Y, "treat", rho=0.2)


fit.M <- lm(job_seek ~ treat + econ_hard + sex + age , data=jobs)
fit.Y <- lm(depress2 ~ treat*job_seek+ econ_hard + sex + age , data=jobs)
fimle.lnl(fit.M, fit.Y, "treat", rho=0.5)




