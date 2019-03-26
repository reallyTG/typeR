library(picante)


### Name: comm.phylo.qr
### Title: Quantile regression slopes between species co-occurrence and
###   phylogenetic distances
### Aliases: comm.phylo.qr
### Keywords: univar

### ** Examples

data(phylocom)
comm.phylo.qr(phylocom$sample, phylocom$phylo, metric="cij",
  null.model="sample.taxa.labels", runs=99)


