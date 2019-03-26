library(gradDescent)


### Name: ADAGRAD
### Title: ADAGRAD Method Learning Function
### Aliases: ADAGRAD

### ** Examples

##################################
## Learning and Build Model with ADAGRAD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with ADAGRAD
ADAGRADmodel <- ADAGRAD(splitedDataSet$dataTrain)
#show result
print(ADAGRADmodel)




