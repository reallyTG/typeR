library(RAM)


### Name: dissim
### Title: Calculate Dissimilarity Matrix Data
### Aliases: dissim dissim.clust dissim.eig dissim.ord dissim.GOF
###   dissim.tree dissim.pvar
### Keywords: datagen

### ** Examples

data(ITS1)
# calculate clustering, using default method
dissim.clust(ITS1)
# calculate tree distances, specifying a distance method
# (but use default clustering method)
dissim.tree(ITS1, dist.method="euclidean")
# calcualte ordination distances, specifying both distance
# and ordination methods
dissim.ord(ITS1, dist.method="bray", k=3)



