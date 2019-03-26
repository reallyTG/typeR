library(secr)


### Name: reduce
### Title: Combine Columns
### Aliases: reduce reduce.default
### Keywords: manip

### ** Examples


## matrix with random zeros
temp <- matrix(runif(20), nc = 4)
temp[sample(20,10)] <- 0
temp

reduce(temp, list(1:2, 3:4))




