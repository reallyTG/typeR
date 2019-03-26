library(gradDescent)


### Name: SVRG
### Title: Stochastic Variance Reduce Gradient (SVRG) Method Learning
###   Function
### Aliases: SVRG

### ** Examples

##################################
## Learning and Build Model with SVRG
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## split dataset
splitedDataSet <- splitData(dataSet)
## build model with SVRG
SVRGmodel <- SVRG(splitedDataSet$dataTrain)
#show result
print(SVRGmodel)




