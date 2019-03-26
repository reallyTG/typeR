library(optpart)


### Name: disdiam
### Title: Dissimilarity Diameters of a Partition
### Aliases: disdiam disdiam.default disdiam.stride print.disdiam
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray')
    opt.5 <- optpart(5,dis.bc)
    disdiam(opt.5,dis.bc)



