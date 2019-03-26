library(gradDescent)


### Name: minmaxDescaling
### Title: Min-Max Scaling Revert Function
### Aliases: minmaxDescaling

### ** Examples

##################################
## Revert Min-Max Scaling
## load R Package data
data(gradDescentRData)
## get z-factor Data
dataSet <- gradDescentRData$CompressilbilityFactor
fsr <- minmaxScaling(dataSet)
rfsr <- minmaxDescaling(fsr$scaledDataSet, fsr$scalingParameter)




