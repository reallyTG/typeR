library(biclust)


### Name: BCXmotifs
### Title: The Xmotifs Bicluster algorithm
### Aliases: BCXmotifs BCXmotifs-class Xmotif
###   biclust,matrix,BCXmotifs-method
### Keywords: cluster classif

### ** Examples

data(BicatYeast)
x<-discretize(BicatYeast)
res <- biclust(x, method=BCXmotifs(), ns=20, nd=20, sd=5, alpha=0.01, number=10)
res



