library(optpart)


### Name: optpart
### Title: Optimal Partitioning of Dissimilarity/Distance Matrices
### Aliases: optpart optpart.default optpart.clustering optpart.partana
###   optpart.partition optpart.stride
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    opt.5 <- optpart(5,dis.bc)
    summary(opt.5)



