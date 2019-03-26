library(clinfun)


### Name: coxphERR
### Title: Heller Explained Relative Risk
### Aliases: coxphERR
### Keywords: survival

### ** Examples

## Not run: 
##D  library(survival)
##D  ovarianfit <- coxph(Surv(futime, fustat) ~ age + resid.ds + rx +
##D                                            ecog.ps, data=ovarian,x=T) 
##D  # Compute the explained relative risk (ERR) and
##D  # its standard error (se.ERR) for the full model.
##D  coxphERR(ovarianfit)       
##D  # Compute the contribution of age and ECOG performance status to
##D  # the explained relative risk. Age and ECOG performance status are 
##D  # the first and fourth covariates in the model.
##D  coxphERR(ovarianfit, c(1,4))
## End(Not run)


