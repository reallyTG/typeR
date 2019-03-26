library(clues)


### Name: plotClusters
### Title: Scatter Plots of Clusters in Specified Dimensions
### Aliases: plotClusters
### Keywords: cluster

### ** Examples

    # Maronna data set
    data(Maronna)

    # data matrix
    maronna <- Maronna$maronna

    # cluster membership
    maronna.mem <- Maronna$maronna.mem
    
    plotClusters(maronna, maronna.mem)



