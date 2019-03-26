library(CORElearn)


### Name: classDataGen
### Title: Artificial data for testing classification algorithms
### Aliases: classDataGen
### Keywords: data datagen

### ** Examples

#prepare a classification data set
classData <-classDataGen(noInst=200)

# build random forests model with certain parameters
modelRF <- CoreModel(class~., classData, model="rf",
              selectionEstimator="MDL", minNodeWeightRF=5,
              rfNoTrees=100, maxThreads=1)
print(modelRF)
destroyModels(modelRF) # clean up



