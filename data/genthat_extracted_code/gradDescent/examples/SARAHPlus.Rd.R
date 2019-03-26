library(gradDescent)


### Name: SARAHPlus
### Title: Stochastic Recursive Gradient Algorithm+ (SARAH+) Method
###   Learning Function
### Aliases: SARAHPlus

### ** Examples

##################################
## Learning and Build Model with SARAH+
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with SARAH+
SARAHPlusmodel <- SARAHPlus(splitedDataSet$dataTrain)
#show result
print(SARAHPlusmodel)




