library(gradDescent)


### Name: prediction
### Title: Predicting Function for Linear Model
### Aliases: prediction

### ** Examples

##################################
## Predict Testing Data Using GD Model
## load R Package data
data(gradDescentRData)
## get z-factor Data
dataSet <- gradDescentRData$CompressilbilityFactor
## do variance scaling to dataset
featureScalingResult <- varianceScaling(dataSet)
## split dataset
splitedDataSet <- splitData(featureScalingResult$scaledDataSet)
## built model using GD
model <- GD(splitedDataSet$dataTrain)
## separate testing data with input only
dataTestInput <- (splitedDataSet$dataTest)[,1:ncol(splitedDataSet$dataTest)-1]
## predict testing data using GD model
prediction <- prediction(model,dataTestInput)
## show result()
prediction


##################################
## Predict Testing Data Using SARAHPlus Model
## load R Package data
data(gradDescentRData)
## get z-factor Data
dataSet <- gradDescentRData$CompressilbilityFactor
## do variance scaling to dataset
featureScalingResult <- varianceScaling(dataSet)
## split dataset
splitedDataSet <- splitData(featureScalingResult$scaledDataSet)
## built model using SARAHPlus
model <- SARAHPlus(splitedDataSet$dataTrain, alpha=0.1, maxIter=10,
         innerIter=10, gammaS=0.125, seed=NULL)
## separate testing data with input only
dataTestInput <- (splitedDataSet$dataTest)[,1:ncol(splitedDataSet$dataTest)-1]
## predict testing data using GD model
prediction <- prediction(model,dataTestInput)
## show result()
prediction




