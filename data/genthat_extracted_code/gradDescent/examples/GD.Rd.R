library(gradDescent)


### Name: GD
### Title: Gradient Descent (GD) Method Learning Function
### Aliases: GD

### ** Examples

##################################
## Learning and Build Model with GD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with GD
GDmodel <- GD(splitedDataSet$dataTrain)
#show result
print(GDmodel)




