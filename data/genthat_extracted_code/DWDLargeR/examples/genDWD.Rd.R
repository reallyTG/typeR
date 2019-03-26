library(DWDLargeR)


### Name: genDWD
### Title: Solve the generalized distance weighted discrimination (DWD)
###   model.
### Aliases: genDWD
### Keywords: DWD

### ** Examples

# load the data
data("mushrooms")
# calculate the best penalty parameter
C = penaltyParameter(mushrooms$X,mushrooms$y,expon=1)
# solve the generalized DWD model
result = genDWD(mushrooms$X,mushrooms$y,C,expon=1)



