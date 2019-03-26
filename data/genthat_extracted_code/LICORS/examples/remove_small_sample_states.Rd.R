library(LICORS)


### Name: remove_small_sample_states
### Title: Reassign low sample states to close states
### Aliases: remove_small_sample_states
### Keywords: manip method

### ** Examples

set.seed(10)
WW <- matrix(c(rexp(1000, 1/10), runif(1000)), ncol = 5, byrow = FALSE)
WW <- normalize(WW)
colSums(WW)
remove_small_sample_states(WW, 20)



