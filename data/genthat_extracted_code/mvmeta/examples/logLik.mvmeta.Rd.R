library(mvmeta)


### Name: logLik.mvmeta
### Title: Extract Log-Likelihood from mvmeta Objects
### Aliases: logLik.mvmeta
### Keywords: models regression multivariate methods

### ** Examples

# RUN THE MODEL 
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98)

# LOG-LIKELIHOOD
ll <- logLik(model)
ll
attributes(ll)

# AIC and BIC
AIC(model)
BIC(model)



