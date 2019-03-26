library(gradDescent)


### Name: minmaxScaling
### Title: The Min-Max Feature Scaling Function
### Aliases: minmaxScaling

### ** Examples

##################################
## Feature scaling with Min-Max Scaling Method
## load R Package data
data(gradDescentRData)
## get z-factor Data
dataSet <- gradDescentRData$CompressilbilityFactor
## do min-max scaling to dataset
featureScalingResult <- minmaxScaling(dataSet)
## show result
print(featureScalingResult$scaledDataSet)
print(featureScalingResult$scalingParameter)




