library(goft)


### Name: lnorm_test
### Title: Test for the lognormal distribution
### Aliases: lnorm_test
### Keywords: htest

### ** Examples

# Testing the lognormal distribution hypothesis  on the compressive strength variable
# of the strength data set.
data("strength")
x  <- strength$cstrength   # compressive strength
lnorm_test(x)              # testing the lognormal distribution hypothesis 



