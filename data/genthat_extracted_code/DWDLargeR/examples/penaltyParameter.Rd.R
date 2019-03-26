library(DWDLargeR)


### Name: penaltyParameter
### Title: Compute the penalty parameter for the model.
### Aliases: penaltyParameter
### Keywords: DWD

### ** Examples

# load the data
data("mushrooms")
# calculate the best penalty parameter
C = penaltyParameter(mushrooms$X,mushrooms$y,expon=1)



