library(gradDescent)


### Name: varianceScaling
### Title: The Variance/Standardization Feature Scaling Function
### Aliases: varianceScaling

### ** Examples

##################################
## Feature scaling with Variance Scaling Method
## load R Package data
data(gradDescentRData)
## get z-factor Data
dataSet <- gradDescentRData$CompressilbilityFactor
## do variance scaling to dataset
featureScalingResult <- varianceScaling(dataSet)
## show result
print(featureScalingResult$scaledDataSet)
print(featureScalingResult$scalingParameter)




