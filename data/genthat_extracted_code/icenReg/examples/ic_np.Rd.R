library(icenReg)


### Name: ic_np
### Title: Non-Parametric Estimator for Interval Censored Data
### Aliases: ic_np

### ** Examples

data(miceData)
fit <- ic_np(cbind(l, u) ~ grp, data = miceData)
# Stratifies fits by group

plot(fit) 



