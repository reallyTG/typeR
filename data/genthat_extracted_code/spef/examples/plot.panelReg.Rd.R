library(spef)


### Name: plot.panelReg
### Title: Plot a 'panelReg' Object.
### Aliases: plot.panelReg

### ** Examples

data(blaTum)
## Plot the fit of bladder tumor data set
formula <- PanelSurv(id, time, count) ~ num + size + treatment
fit1 <- panelReg(formula, data=blaTum, method = "AEE", se = "Sandwich")
plot(fit1)

fit2 <- panelReg(formula, data=blaTum, method = "MLs", se = "NULL")
plot(fit2)



