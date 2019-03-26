library(phangorn)


### Name: upgma
### Title: UPGMA and WPGMA
### Aliases: upgma wpgma
### Keywords: cluster

### ** Examples


data(Laurasiatherian)
dm = dist.ml(Laurasiatherian)
tree = upgma(dm)
plot(tree)




