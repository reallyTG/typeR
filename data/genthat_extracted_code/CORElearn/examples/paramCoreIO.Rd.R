library(CORElearn)


### Name: paramCoreIO
### Title: Input/output of parameters from/to file
### Aliases: paramCoreIO
### Keywords: models regression nonlinear tree classif

### ** Examples

# use iris data
# build random forests model with certain parameters
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL",minNodeWeightRF=5,
              rfNoTrees=50, maxThreads=1)

# writes all the used parameters to file
paramCoreIO(modelRF, "parameters.par", io="write")
# and reads them back into the model
paramCoreIO(modelRF, "parameters.par", io="read")

destroyModels(modelRF) # clean up




