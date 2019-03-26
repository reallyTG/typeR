library(kinfit)


### Name: kinfit
### Title: Fit kinetic models to chemical degradation data
### Aliases: kinfit
### Keywords: models regression nonlinear

### ** Examples

data(FOCUS_2006_A)
(kinfits <- kinfit(FOCUS_2006_A))
data(FOCUS_2006_B)
(kinfits <- kinfit(FOCUS_2006_B, kinmodels=c("SFO","FOMC")))



