library(survivalMPL)


### Name: coxph_mpl
### Title: Fit Cox Proportional Hazards Regression Model Via MPL
### Aliases: coxph_mpl print.coxph_mpl
### Keywords: survival

### ** Examples

## Not run: 
##D ## data lung of the survival package. Refer to ?lung.
##D data(lung)
##D 
##D fit_mpl <- coxph_mpl(Surv(time, status == 2) ~ age + sex + ph.karno + wt.loss, data = lung)
##D 
##D fit_mpl
## End(Not run)



