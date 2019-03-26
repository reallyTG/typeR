library(clues)


### Name: Maronna
### Title: The Maronna Data Set
### Aliases: Maronna maronna maronna.mem
### Keywords: cluster

### ** Examples

    data(Maronna)
    # data matrix
    maronna <- Maronna$maronna

    # cluster membership
    maronna.mem <- Maronna$maronna.mem
    # 'true' number of clusters
    nClust <- length(unique(maronna.mem))

    # scatter plots
    plotClusters(maronna, maronna.mem)




