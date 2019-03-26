library(bigtime)


### Name: bigtime
### Title: bigtime: A package for obtaining sparse estimates of large time
###   series models.
### Aliases: bigtime bigtime-package

### ** Examples

# Fit a sparse VAR model
data(Y)
VARfit <- sparseVAR(Y) # sparse VAR
Lhat <- lagmatrix(fit=VARfit, model="VAR") # get estimated lagmatrix
VARforecast <- directforecast(fit=VARfit, model="VAR", h=1) # get one-step ahead forecasts



