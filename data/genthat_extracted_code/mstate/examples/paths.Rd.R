library(mstate)


### Name: paths
### Title: Find all possible trajectories through a given multi-state model
### Aliases: paths
### Keywords: array

### ** Examples

tmat <- matrix(NA,5,5)
tmat[1,2:3] <- 1:2
tmat[1,5] <- 3
tmat[2,4:5] <- 4:5
tmat[3,4:5] <- 6:7
tmat[4,5] <- 8
paths(tmat)
paths(tmat, start=3)



