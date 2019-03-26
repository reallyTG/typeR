library(gradDescent)


### Name: ADAM
### Title: ADADELTA Method Learning Function
### Aliases: ADAM

### ** Examples

##################################
## Learning and Build Model with ADAM
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with ADAM
ADAMmodel <- ADAM(splitedDataSet$dataTrain)
#show result
print(ADAMmodel)




