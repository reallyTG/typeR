library(phangorn)


### Name: NJ
### Title: Neighbor-Joining
### Aliases: NJ PNJ UNJ
### Keywords: cluster

### ** Examples


data(Laurasiatherian)
dm <- dist.ml(Laurasiatherian)
tree <- NJ(dm)
plot(tree)




