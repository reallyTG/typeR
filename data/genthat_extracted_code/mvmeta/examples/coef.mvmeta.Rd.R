library(mvmeta)


### Name: coef.mvmeta
### Title: Extract Coefficients and (Co)Variance Matrix from mvmeta Objects
### Aliases: coef.mvmeta vcov.mvmeta
### Keywords: models regression multivariate methods

### ** Examples

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98)

# COEFFICIENTS
model$coef
coef(model)
coef(model,format="matrix")
summary(model)$coef

# (CO)VARIANCE MATRIX
vcov(model)



