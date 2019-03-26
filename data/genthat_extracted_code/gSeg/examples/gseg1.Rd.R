library(gSeg)


### Name: gseg1
### Title: Graph-Based Change-Point Detection for Single Change-Point
### Aliases: gseg1

### ** Examples


data(Example)
# Five examples, each example is a n-length sequence.
# Ei (i=1,...,5): an edge matrix representing a similarity graph constructed on the
# observations in the ith sequence.  
# Check '?gSeg' to see how the Ei's were constructed.


## E1 is an edge matrix representing a similarity graph.
# It is constructed on a sequence of length n=200 with a change in mean 
# in the middle of the sequence (tau = 100).

r1 = gseg1(n,E1, statistics="all")  
# output results based on all four statistics
# the scan statistics can be found in r1$scanZ
r1_a = gseg1(n,E1, statistics="w")  
# output results based on the weighted edge-count statistic
r1_b = gseg1(n,E1, statistics=c("w","g"))  
# output results based on the weighted edge-count statistic 
# and generalized edge-count statistic


## E2 is an edge matrix representing a similarity graph.
# It is constructed on a sequence of length n=200 with a change in mean 
# away from the middle of the sequence (tau=45).
r2 = gseg1(n,E2,statistic="all")


## E3 is an edge matrix representing a similarity graph.
# It is constructed on a sequence of length n=200 with a change in both mean 
# and variance away from the middle of the sequence (tau = 145).
r3=gseg1(n,E3,statistic="all")


## E4 is an edge matrix representing a similarity graph.
# It is constructed on a sequence of length n=200 with a change in both mean 
# and variance away from the middle of the sequence (tau = 50).
r4=gseg1(n,E4,statistic="all")




