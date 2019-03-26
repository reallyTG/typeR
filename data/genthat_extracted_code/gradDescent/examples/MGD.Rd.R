library(gradDescent)


### Name: MGD
### Title: Momentum Gradient Descent (MGD) Method Learning Function
### Aliases: MGD

### ** Examples

##################################
## Learning and Build Model with MGD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with MGD
MGDmodel <- MGD(splitedDataSet$dataTrain)
#show result
print(MGDmodel)




