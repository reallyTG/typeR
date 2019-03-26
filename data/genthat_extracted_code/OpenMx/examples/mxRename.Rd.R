library(OpenMx)


### Name: mxRename
### Title: Rename MxModel or a Submodel
### Aliases: mxRename

### ** Examples


library(OpenMx)

# create two empty models
modelA <- mxModel(model='modelA')
modelB <- mxModel(model='modelB')

# create a parent model with two submodels
modelC <- mxModel(model='modelC', modelA, modelB)

# Rename modelC to model1
model1 <- mxRename(modelC, 'model1')

# Rename submodel modelB to model2
model1 <- mxRename(model1, oldname = 'modelB', newname = 'model2')

model1




