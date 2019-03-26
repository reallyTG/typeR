library(survivalMPL)


### Name: coef.coxph_mpl
### Title: Extract coefficients of a coxph_mpl Object or of its 'summary'
### Aliases: coef.coxph_mpl coef.summary.coxph_mpl
### Keywords: survival

### ** Examples

## Not run: 
##D data(lung)
##D 
##D fit_mpl <- coxph_mpl(Surv(time, status == 2) ~ age + sex + ph.karno + wt.loss, data = lung)
##D 
##D coef(fit_mpl)
##D coef(summary(fit_mpl))
## End(Not run)



