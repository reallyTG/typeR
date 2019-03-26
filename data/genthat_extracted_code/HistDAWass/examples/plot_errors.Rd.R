library(HistDAWass)


### Name: plot_errors
### Title: A function for plotting functions of errors
### Aliases: plot_errors

### ** Examples

## do a regression
pars=WH.regression.two.components(BLOOD,Yvar = 1,Xvars = c(2:3))
## predict data
PRED=WH.regression.two.components.predict(data = BLOOD[,2:3],parameters = pars)
## define observed data
OBS=BLOOD[,1]
plot_errors(PRED,OBS,"HISTO_QUA")
plot_errors(PRED,OBS,"HISTO_DEN")
plot_errors(PRED,OBS,"DENS_KDE")



