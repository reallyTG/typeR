library(optpart)


### Name: typal
### Title: Identification of Typal Samples in a Partition
### Aliases: typal
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray')
    opt.5 <- bestopt(dis.bc,5,20)
    typal(opt.5,dis.bc,3)



