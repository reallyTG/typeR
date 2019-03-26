library(EMCluster)


### Name: Rand Index
### Title: Rand Index and Adjusted Rand Index
### Aliases: RRand
### Keywords: summary

### ** Examples

library(EMCluster, quietly = TRUE)

true.id <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
pred.id <- c(2, 1, 2, 1, 1, 1, 2, 1, 1)
label   <- c(0, 0, 0, 0, 1, 0, 2, 0, 0)

RRand(true.id, pred.id)
RRand(true.id, pred.id, lab = label)



