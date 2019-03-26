library(gradDescent)


### Name: MBGD
### Title: Mini-Batch Gradient Descent (MBGD) Method Learning Function
### Aliases: MBGD

### ** Examples

##################################
## Learning and Build Model with MBGD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with 0.8 batch rate MBGD
MBGDmodel <- MBGD(splitedDataSet$dataTrain, nBatch=2)
#show result
print(MBGDmodel)




