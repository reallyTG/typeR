library(gradDescent)


### Name: SAGD
### Title: Stochastic Average Gradient Descent (SAGD) Method Learning
###   Function
### Aliases: SAGD

### ** Examples

##################################
## Learning and Build Model with SAGD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with SAGD
SAGDmodel <- SAGD(splitedDataSet$dataTrain)
#show result
print(SAGDmodel)




