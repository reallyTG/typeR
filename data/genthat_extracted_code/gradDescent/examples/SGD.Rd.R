library(gradDescent)


### Name: SGD
### Title: Stochastic Gradient Descent (SGD) Method Learning Function
### Aliases: SGD

### ** Examples

##################################
## Learning and Build Model with SGD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with SGD
SGDmodel <- SGD(splitedDataSet$dataTrain)
#show result
print(SGDmodel)




