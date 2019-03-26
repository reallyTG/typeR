library(comf)


### Name: calcTPRTSV
### Title: Calculating the True Positive Rate between Predicted and Actual
###   Thermal Sensation Vote
### Aliases: calcTPRTSV TPR tpr
### Keywords: manip

### ** Examples

## Define data
ref <- rnorm(5) # actual thermal sensation votes
ref <- cutTSV(ref)

pred <- rnorm(5) # predicted thermal sensation votes
pred <- cutTSV(pred)

calcTPRTSV(ref, pred)



