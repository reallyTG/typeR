library(optpart)


### Name: classmatch
### Title: Classification Matching and Differencing
### Aliases: classmatch
### Keywords: cluster

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    opt.5 <- optpart(5,dis.bc)
    pam.5 <- pam(dis.bc,5)
    classmatch(opt.5,pam.5)



