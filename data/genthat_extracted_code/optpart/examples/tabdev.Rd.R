library(optpart)


### Name: tabdev
### Title: Classification Validity Assessment by Table Deviance
### Aliases: tabdev summary.tabdev tabdev.stride tabdev.default
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    opt.5 <- optpart(5,dis.bc)
    tabdev(shoshveg,opt.5)



