library(STAR)


### Name: print.repeatedTrain
### Title: Print and Summary Methods for repeatedTrain Objects
### Aliases: print.repeatedTrain summary.repeatedTrain
###   print.summary.repeatedTrain
### Keywords: ts survival

### ** Examples

## Load the Vanillin responses of the first
## cockroach data set
data(CAL1V)
## convert them into repeatedTrain objects
## The stimulus command is on between 4.49 s and 4.99s
CAL1V <- lapply(CAL1V,as.repeatedTrain)
## Generate raster plot for the neurons
raster(CAL1V[["neuron 1"]],c(4.49,4.99))
plot(CAL1V[["neuron 2"]],c(4.49,4.99))
plot(CAL1V[["neuron 3"]],c(4.49,4.99))
## Basic summary of neuron 1
summary(CAL1V[["neuron 1"]])
## Enhanced summary giving a response window between 5 and 5.5s
summary(CAL1V[["neuron 1"]],c(5,5.5))



