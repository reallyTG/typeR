library(clues)


### Name: adjustedRand
### Title: Calculate Agreement Indices Between Two Partitions for a Data
###   Set
### Aliases: adjustedRand
### Keywords: cluster

### ** Examples

    cl1 <- c(1, 1, 1, 2, 2, 2, 2, 2)
    cl2 <- c(1, 2, 1, 2, 1, 2, 1, 3)
    adjustedRand(cl1, cl2)
    
    # perfect agreement
    cl1 <- c(1, 1, 2, 2)
    cl2 <- cl1
    adjustedRand(cl1, cl2)
    



