library(icenReg)


### Name: ic_par
### Title: Parametric Regression Models for Interval Censored Data
### Aliases: ic_par

### ** Examples

data(miceData)

logist_ph_fit <- ic_par(Surv(l, u, type = 'interval2') ~ grp, 
                       data = miceData, dist = 'loglogistic')

logist_po_fit <- ic_par(cbind(l, u) ~ grp, 
                        data = miceData, dist = 'loglogistic',
                       model = 'po')

summary(logist_ph_fit)
summary(logist_po_fit)



