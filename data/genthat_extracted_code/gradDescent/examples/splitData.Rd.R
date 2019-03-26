library(gradDescent)


### Name: splitData
### Title: The Data Spliting Function
### Aliases: splitData

### ** Examples

##################################
## Splitting Dataset into Training and Testing Data
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
#show result
print(splitedDataSet$dataTrain)
print(splitedDataSet$dataTest)




