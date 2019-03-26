library(adespatial)


### Name: msr.mantelrtest
### Title: Moran spectral randomization for Mantel test
### Aliases: msr.mantelrtest
### Keywords: spatial

### ** Examples


if(require("ade4", quietly = TRUE) 
& require("spdep", quietly = TRUE)){
data(mafragh, package = "ade4")

d1 <- dist(mafragh$env[,1:3])
d2 <- dist(mafragh$env[,7])
t1 <- mantel.randtest(d1,d2)
t1

lw <- nb2listw(mafragh$nb)
t2 <- msr(t1, listwORorthobasis = lw)
t2

}




