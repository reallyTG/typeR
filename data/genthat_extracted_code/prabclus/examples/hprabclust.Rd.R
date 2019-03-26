library(prabclus)


### Name: hprabclust
### Title: Clustering of species ranges from presence-absence matrices
###   (hierarchical methods)
### Aliases: hprabclust print.comprabclust
### Keywords: cluster spatial

### ** Examples

data(kykladspecreg)
data(nb)
data(waterdist)
x <- prabinit(prabmatrix=kykladspecreg, neighborhood=nb,
              geodist=waterdist, distance="geco")
hprabclust(x,mdsplot=FALSE)



