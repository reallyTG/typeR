library(survival)


### Name: residuals.coxph
### Title: Calculate Residuals for a 'coxph' Fit
### Aliases: residuals.coxph.penal residuals.coxph.null residuals.coxph
### Keywords: survival

### ** Examples


 fit <- coxph(Surv(start, stop, event) ~ (age + surgery)* transplant,
               data=heart)
 mresid <- resid(fit, collapse=heart$id)



