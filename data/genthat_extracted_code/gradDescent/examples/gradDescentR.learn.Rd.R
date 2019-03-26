library(gradDescent)


### Name: gradDescentR.learn
### Title: GradDescent Learning Function
### Aliases: gradDescentR.learn

### ** Examples

##################################
## Learning and Build Model with GD
## load R Package data
data(gradDescentRData)
## get z-factor data
dataSet <- gradDescentRData$CompressilbilityFactor
## train dataset
modelObject <- gradDescentR.learn(dataSet)




