library(comf)


### Name: calcAvgAcc
### Title: Calculating Average Accuracy between Predicted and Actual
###   Thermal Sensation Vote
### Aliases: calcAvgAcc AvgAcc avgAcc avgacc
### Keywords: manip

### ** Examples

## Define data
ref <- rnorm(5) # actual thermal sensation votes
ref <- cutTSV(ref)

pred <- rnorm(5) # predicted thermal sensation votes
pred <- cutTSV(pred)

calcAvgAcc(ref, pred)



