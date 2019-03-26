library(gradDescent)


### Name: RMSE
### Title: RMSE Calculator Function
### Aliases: RMSE

### ** Examples

##################################
## Calculate Error using RMSE
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
predictionData <- prediction(model, dataTestInput)
## calculate error using rmse
errorValue <- RMSE(splitedDataSet$dataTest[,ncol(splitedDataSet$dataTest)],
predictionData[,ncol(predictionData)])
## show result
errorValue




