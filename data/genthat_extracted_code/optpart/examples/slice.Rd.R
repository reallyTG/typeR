library(optpart)


### Name: slice
### Title: Slice a Hierarchical Clustering Dendrogram with a Mouse
### Aliases: slice
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    demo <- hclust(dis.bc,'ave')
    ave.5 <- slice(demo,5)
    ## Not run: plot(demo)
    ## Not run: ave.clust <- slice(demo)



