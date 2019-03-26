library(spef)


### Name: panelReg
### Title: Fits Semiparametric Regression Models for Panel Count Survival
###   Data
### Aliases: panelReg

### ** Examples

## Not run: 
##D data(blaTum)
##D ## Fit the bladder tumor data set
##D formula <- PanelSurv(id, time, count) ~ num + size + treatment
##D 
##D panelReg(formula, data = blaTum, method = "AEE", se = "Sandwich")
##D panelReg(formula, data = blaTum, method = "AEEX", se = "Impute",
##D          control = list(a = 0.1, R = 30))
##D panelReg(formula, data = blaTum, method = "HWZ", se = "Bootstrap",
##D          control = list(R = 30))
##D panelReg(formula, data = blaTum, method = "MLs", se = "NULL")
##D panelReg(formula, data = blaTum, method = "EE.SWa", se = "Bootstrap",
##D          control = list(R = 30))
##D panelReg(formula, data = blaTum, method = "EE.HSWc", se = "Bootstrap",
##D          control = list(R = 30))
## End(Not run)




