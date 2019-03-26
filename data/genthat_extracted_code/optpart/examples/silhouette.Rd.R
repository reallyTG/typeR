library(optpart)


### Name: silhouette.partana
### Title: Produce a Silhouette Object From a Partana, Clustering, or
###   Stride Object
### Aliases: silhouette.partana silhouette.clustering silhouette.stride
###   testsil
### Keywords: cluster

### ** Examples

    data(shoshveg) # produces a data frame of vegetation data, 
                   #samples as rows, attributes as columns
    dis.bc <- dsvdis(shoshveg,'bray/curtis') # produces a Bray/Curtis dissimilarity matrix
    opt.5 <- optpart(5,dis.bc) # produces an optimal partitioning into 5 clusters
    silhouette(opt.5,dis.bc) # calculates the silhouette values
    ## Not run: plot(silhouette(opt.5,dis.bc)) # produce silhouette plot on current device



