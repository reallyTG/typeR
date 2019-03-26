library(survivalMPL)


### Name: residuals.coxph_mpl
### Title: Residuals for a Cox model
### Aliases: residuals.coxph_mpl plot.residuals.coxph_mpl
### Keywords: survival

### ** Examples

## Not run: 
##D ### lung data of the survival package (see ?lung)
##D data(lung)
##D fit_mpl <- coxph_mpl(Surv(time, status == 2) ~ age + sex + ph.karno + wt.loss, data = lung)
##D 
##D par(mfrow=c(1,2))
##D plot(residuals(fit_mpl), which=1:2, ask=FALSE)
## End(Not run)



