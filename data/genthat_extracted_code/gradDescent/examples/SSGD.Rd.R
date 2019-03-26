library(gradDescent)


### Name: SSGD
### Title: Semi Stochastic Gradient Descent (SSGD) Method Learning Function
### Aliases: SSGD

### ** Examples

##################################
## Learning and Build Model with SSGD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with SSGD
SSGDmodel <- SSGD(splitedDataSet$dataTrain)
#show result
print(SSGDmodel)




