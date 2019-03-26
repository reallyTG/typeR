library(spray)


### Name: ooom
### Title: One-over-one-minus for spray objects
### Aliases: ooom
### Keywords: symbolmath

### ** Examples


a <- homog(4,2)
jj <-  (1-a)*ooom(a,3)


constant(jj)    # should be 1
rowSums(index(jj))   # a single 0 and lots of 8s.





