library(optpart)


### Name: testpart
### Title: Identify Misclassified Plots in a Partition
### Aliases: testpart
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    opt.5 <- optpart(5,dis.bc)
    testpart(opt.5)



