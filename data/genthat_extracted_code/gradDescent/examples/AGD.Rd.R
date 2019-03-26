library(gradDescent)


### Name: AGD
### Title: Accelerated Gradient Descent (AGD) Method Learning Function
### Aliases: AGD

### ** Examples

##################################
## Learning and Build Model with AGD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with AGD
AGDmodel <- AGD(splitedDataSet$dataTrain)
#show result
print(AGDmodel)




