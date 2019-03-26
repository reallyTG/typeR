library(RFreak)


### Name: LTSevol
### Title: Least Trimmed Squares Robust Regression
### Aliases: LTSevol
### Keywords: robust interface

### ** Examples

# load example data
data(stackloss)

# compute LTS regression
LTSevol(stackloss[, 4],stackloss[, 1:3],adjust=TRUE,runs=1,generations=1000)



