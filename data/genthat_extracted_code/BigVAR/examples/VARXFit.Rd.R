library(BigVAR)


### Name: VARXFit
### Title: Fit a VAR or VARX model by least squares
### Aliases: VARXFit

### ** Examples

data(Y)
# fit a VAR_3(3)
mod <- VARXFit(Y,3,NULL,NULL)
# fit a VAR_3 with p= 6 and lag selected according to AIC
modAIC <- VARXFit(Y,6,"AIC",NULL)
# Fit a VARX_{2,1} with p=6, s=4 and lags selected by BIC
modXBIC <- VARXFit(Y,6,"BIC",list(k=1,s=4))




