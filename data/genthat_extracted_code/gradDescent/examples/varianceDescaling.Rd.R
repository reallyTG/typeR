library(gradDescent)


### Name: varianceDescaling
### Title: Variance/Standardization Revert Function
### Aliases: varianceDescaling

### ** Examples

##################################
## Revert Variance Scaling
## load R Package data
data(gradDescentRData)
## get z-factor Data
dataSet <- gradDescentRData$CompressilbilityFactor
fsr <- varianceScaling(dataSet)
rfsr <- varianceDescaling(fsr$scaledDataSet, fsr$scalingParameter)




