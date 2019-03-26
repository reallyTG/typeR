library(fpc)


### Name: distcritmulti
### Title: Distance based validity criteria for large data sets
### Aliases: distcritmulti
### Keywords: cluster

### ** Examples

    set.seed(20000)
    options(digits=3)
    face <- rFace(50,dMoNo=2,dNoEy=0,p=2)
    clustering <- as.integer(attr(face,"grouping"))
    distcritmulti(face,clustering,ns=3,seed=100000,criterion="pearsongamma")



