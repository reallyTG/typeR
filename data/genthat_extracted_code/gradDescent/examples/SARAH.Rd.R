library(gradDescent)


### Name: SARAH
### Title: Stochastic Recursive Gradient Algorithm (SARAH) Method Learning
###   Function
### Aliases: SARAH

### ** Examples

##################################
## Learning and Build Model with SARAH
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with SARAH
SARAHmodel <- SARAH(splitedDataSet$dataTrain)
#show result
print(SARAHmodel)




