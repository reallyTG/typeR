library(optpart)


### Name: phi
### Title: Calculating the phi Statistic on Taxon Classifications
### Aliases: phi
### Keywords: htest

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray')
    opt.5 <- optpart(5,dis.bc)
    phi(shoshveg,opt.5)



