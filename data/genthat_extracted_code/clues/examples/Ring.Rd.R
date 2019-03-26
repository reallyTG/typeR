library(clues)


### Name: Ring
### Title: The Broken-Ring Data Set
### Aliases: Ring ring ring.mem
### Keywords: cluster

### ** Examples

    data(Ring)
 
    # data matrix
    ring <- Ring$ring
 
    # 'true' cluster membership
    ring.mem <- Ring$ring.mem

    # 'true' number of clusters
    nClust <- length(unique(ring.mem))

    # scatter plots
    plotClusters(ring, ring.mem)




