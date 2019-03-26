library(clues)


### Name: shrinking
### Title: Data Sharpening Based on K-nearest Neighbors
### Aliases: shrinking
### Keywords: cluster

### ** Examples

    # Maronna data set
    data(Maronna)
    # data matrix
    maronna <- Maronna$maronna

    # cluster membership
    maronna.mem <- Maronna$maronna.mem

    tt <- shrinking(maronna, K = 5, itmax=1)
    plotClusters(tt, maronna.mem)



