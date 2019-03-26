library(survivalMPL)


### Name: summary.coxph_mpl
### Title: Summarise a coxph_mpl Object
### Aliases: summary.coxph_mpl print.summary.coxph_mpl
### Keywords: survival

### ** Examples

## Not run: 
##D data(lung)
##D 
##D fit_mpl <- coxph_mpl(Surv(time, status == 2) ~ age + sex + ph.karno + wt.loss, data = lung)
##D 
##D summary(fit_mpl, full = TRUE)
##D summary(fit_mpl, se = "M2HM2")
## End(Not run)



