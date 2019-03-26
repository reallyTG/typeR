library(R2admb)


### Name: AIC.admb
### Title: Standard accessor functions for ADMB model fits
### Aliases: AIC.admb confint.admb print.admb summary.admb
###   print.summary.admb logLik.admb coef.admb vcov.admb stdEr stdEr.admb
###   deviance.admb

### ** Examples


 admbex <- system.file("doc","Reedfrog_runs.RData",package="R2admb")
 load(admbex)
 m1
 coef(m1)
 summary(m1)
 coef(summary(m1)) ## returns just z-table
 AIC(m1)
 vcov(m1)
 logLik(m1)
 deviance(m1)
 stdEr(m1)




