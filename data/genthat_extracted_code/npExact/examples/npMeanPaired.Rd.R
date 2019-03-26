library(npExact)


### Name: npMeanPaired
### Title: A test for the mean difference between two bounded random
###   variables given matched pairs.
### Aliases: npMeanPaired
### Keywords: mean pairwise test

### ** Examples


## test whether pain after the surgery is less than before the surgery
data(pain)
npMeanPaired(pain$before, pain$after, lower = 0, upper = 100)

## when the computer was used in the surgery
before_pc <- pain[pain$pc == 1, "before"]
after_pc <- pain[pain$pc == 1, "after"]
npMeanPaired(before_pc, after_pc, lower = 0, upper = 100)

## test whether uncertainty decreased from the first to the second round
data(uncertainty)
npMeanPaired(uncertainty$w1, uncertainty$w2, upper = 60) ## or
with(uncertainty, npMeanPaired(w1, w2, upper = 60))




