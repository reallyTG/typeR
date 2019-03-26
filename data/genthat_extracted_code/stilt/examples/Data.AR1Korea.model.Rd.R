library(stilt)


### Name: Data.AR1Korea.model
### Title: Korean modelled temperature variability and future change
### Aliases: Data.AR1Korea.model
### Keywords: datasets

### ** Examples

# Fit an emulator to the CMIP5 GCM Korean temperature variability and change
# data with innovation standard deviation and time as covariates
data(Data.AR1Korea.model)
data(Data.AR1Korea.par)
emulator(Data.AR1Korea.par, Data.AR1Korea.model, c(TRUE, FALSE), TRUE, 3, 3)



