library(emon)


### Name: permute.groups
### Title: Does randomisation test for the difference in means of two
###   vectors 'v1' and 'v2'.
### Aliases: permute.groups
### Keywords: permutation test

### ** Examples

set.seed(5)
v1 = rnorm(27,10,2); v2=rnorm(25,11,2)
permute.groups(v1, v2, alternative="two")
permute.groups(v1, v2, alt="l")



