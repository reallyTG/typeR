library(optpart)


### Name: partition
### Title: Convert Object to Partition Object
### Aliases: partition partition.partana partition.clustering
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    part <- partana(sample(1:5,nrow(shoshveg),replace=TRUE),dis.bc)
    result <- partition(part,dis.bc)



