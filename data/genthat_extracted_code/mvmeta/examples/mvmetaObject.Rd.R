library(mvmeta)


### Name: mvmetaObject
### Title: mvmeta Objects
### Aliases: mvmetaObject
### Keywords: models regression multivariate

### ** Examples

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98)

# INSPECT THE OBJECT
names(model)

# LABELS
model$lab

# FORMULA
model$formula

# CONVERGED?
model$converged



