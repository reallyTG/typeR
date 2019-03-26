library(wavethresh)


### Name: linfnorm
### Title: Compute L infinity distance between two vectors of numbers.
### Aliases: linfnorm
### Keywords: algebra

### ** Examples

#
# What is the L infinity norm between the following sets of vectors
#
p <- c(1,2,3,4,5)
q <- c(1,2,3,4,5)
r <- c(2,3,4,5,6)
linfnorm(p,q)
# [1] 0
linfnorm(q,r)
# [1] 1
linfnorm(r,p)
# [1] 1



