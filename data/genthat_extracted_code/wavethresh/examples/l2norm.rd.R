library(wavethresh)


### Name: l2norm
### Title: Compute L2 distance between two vectors of numbers.
### Aliases: l2norm
### Keywords: algebra

### ** Examples

#
# What is the L2 norm between the following sets of vectors
#
p <- c(1,2,3,4,5)
q <- c(1,2,3,4,5)
r <- c(2,3,4,5,6)
l2norm(p,q)
# [1] 0
l2norm(q,r)
# [1] 2.236068
l2norm(r,p)
# [1] 2.236068



