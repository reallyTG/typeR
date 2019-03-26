library(gradDescent)


### Name: RMSPROP
### Title: ADADELTA Method Learning Function
### Aliases: RMSPROP

### ** Examples

##################################
## Learning and Build Model with RMSPROP
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with RMSPROP
RMSPROPmodel <- RMSPROP(splitedDataSet$dataTrain)
#show result
print(RMSPROPmodel)




