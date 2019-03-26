library(gradDescent)


### Name: predict.gradDescentRObject
### Title: The gradDescentR prediction stage
### Aliases: predict.gradDescentRObject predict

### ** Examples

##################################
## Predict NewData Using Model Object
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## train dataset
modelObject <- gradDescentR.learn(dataSet)
## create new data input
temp <- c(273.1, 353.1, 363.1)
pres <- c(24.675, 24.675, 24.675)
conf <- c(0.8066773, 0.9235751, 0.9325948)
zfac <- data.frame(temp, pres, conf)
## predict
prediction_data <- predict(modelObject, zfac)


##################################
## Predict NewData Using Model Object
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## train dataset
modelObject <- gradDescentR.learn(dataSet, featureScaling=TRUE, scalingMethod="VARIANCE",
               learningMethod="SARAHPlus", control=list(), seed=NULL)
## create new data input
temp <- c(273.1, 353.1, 363.1)
pres <- c(24.675, 24.675, 24.675)
conf <- c(0.8066773, 0.9235751, 0.9325948)
zfac <- data.frame(temp, pres, conf)
## predict
prediction_data <- predict(modelObject, zfac)




