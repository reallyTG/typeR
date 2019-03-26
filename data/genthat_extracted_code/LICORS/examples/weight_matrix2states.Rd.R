library(LICORS)


### Name: weight_matrix2states
### Title: Returns unique state assignment from a (row-wise) weight matrix
### Aliases: weight_matrix2states
### Keywords: array manip

### ** Examples

WW <- matrix(runif(12), ncol = 3)
WW <- normalize(WW)
WW
weight_matrix2states(WW)
weight_matrix2states(WW, "sample")
# another 'sample' is in general different from previous conversion unless WW is
# a 0/1 matrix
weight_matrix2states(WW, "sample")



