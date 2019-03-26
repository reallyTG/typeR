library(goft)


### Name: gp_test
### Title: Bootstrap test for the generalized Pareto distribution
### Aliases: gp_test
### Keywords: htest

### ** Examples

# Testing the gPd hypothesis on the excesses above the threshold 0.165 ppm of the ozone
# levels given in the o3 data set
data(o3)
o3levels <- o3$ozone_level - 0.165  # ozone levels minus the threshold 0.165 ppm     
gp_test(o3levels)                   # testing the gPd hypothesis



