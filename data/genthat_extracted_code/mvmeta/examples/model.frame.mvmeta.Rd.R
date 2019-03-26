library(mvmeta)


### Name: model.frame.mvmeta
### Title: Extract Model Frame and Design Matrix from mvmeta Objects
### Aliases: model.frame.mvmeta model.matrix.mvmeta
### Keywords: models regression multivariate methods

### ** Examples

# RUN THE MODEL AND SUMMARIZE THE RESULTS
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98,method="ml")

# MODEL FRAME
model$model
model.frame(model)
update(model,method="model.frame")
class(model.frame(model))

# MODEL MATRIX
model.matrix(model)



