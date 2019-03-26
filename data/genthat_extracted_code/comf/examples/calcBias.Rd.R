library(comf)


### Name: calcBias
### Title: Calculating the Bias between Predicted and Actual Thermal
###   Sensation Vote
### Aliases: calcBias calcMeanBias MeanBias meanBias bias calcSdBias
###   calcSeBias
### Keywords: manip

### ** Examples

## Define data
ref <- rnorm(5) # actual thermal sensation votes

pred <- rnorm(5) # predicted thermal sensation votes

calcBias(ref, pred)



