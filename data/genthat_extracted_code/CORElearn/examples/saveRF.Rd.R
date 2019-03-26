library(CORElearn)


### Name: saveRF
### Title: Saves/loads random forests model to/from file
### Aliases: saveRF loadRF
### Keywords: models regression nonlinear tree classif

### ** Examples

# use iris data set


# build random forests model with certain parameters
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL",minNodeWeightRF=5,
              rfNoTrees=100, maxThreads=1)
print(modelRF)

# prediction with node distribution
pred <- predict(modelRF, iris, rfPredictClass=FALSE, type="both")
# print(pred)


# saves the random forests model to file
saveRF(modelRF, "tempRF.txt")

# restore the model to another model
loadedRF = loadRF("tempRF.txt")

# prediction should be the same
predLoaded <- predict(loadedRF, iris, rfPredictClass=FALSE, type="both")
# print(predLoaded)
# sum of differences should be zero subject to numeric imprecision 
sum(pred$probabilities - predLoaded$probabilities) 

cat("Are predicted classes of original and retrieved models equal? ", 
                           all(pred$class == predLoaded$class), "\n" ) 
# cat("Are predicted probabilities of original and retrieved model equal? ", 
#                 all(pred$probabilities == predLoaded$probabilities), "\n" ) 

# clean up the models when no longer needed
destroyModels(modelRF) 
destroyModels(loadedRF) 




