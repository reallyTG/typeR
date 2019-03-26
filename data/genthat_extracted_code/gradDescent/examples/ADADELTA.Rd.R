library(gradDescent)


### Name: ADADELTA
### Title: ADADELTA Method Learning Function
### Aliases: ADADELTA

### ** Examples

##################################
## Learning and Build Model with ADADELTA
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with ADADELTA
ADADELTAmodel <- ADADELTA(splitedDataSet$dataTrain)
#show result
print(ADADELTAmodel)




