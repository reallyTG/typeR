library(mboost)


### Name: survFit
### Title: Survival Curves for a Cox Proportional Hazards Model
### Aliases: survFit survFit.mboost plot.survFit

### ** Examples


library("survival")
data("ovarian", package = "survival")

fm <- Surv(futime,fustat) ~ age + resid.ds + rx + ecog.ps
fit <- glmboost(fm, data = ovarian, family = CoxPH(),
    control=boost_control(mstop = 500))

S1 <- survFit(fit)
S1
newdata <- ovarian[c(1,3,12),]
S2 <- survFit(fit, newdata = newdata)
S2

plot(S1)



