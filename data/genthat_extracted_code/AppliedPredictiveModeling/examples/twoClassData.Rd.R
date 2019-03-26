library(AppliedPredictiveModeling)


### Name: twoClassData
### Title: Two Class Example Data
### Aliases: twoClassData classes
### Keywords: datasets

### ** Examples

data(twoClassData)

library(lattice)
xyplot(PredictorB ~ PredictorA, 
       data = predictors, 
       groups = classes, 
       auto.key = TRUE)




