library(picante)


### Name: comm.phylo.cor
### Title: Correlations between species co-occurrence and phylogenetic
###   distances
### Aliases: comm.phylo.cor
### Keywords: univar

### ** Examples

data(phylocom)
comm.phylo.cor(phylocom$sample, phylocom$phylo, metric="cij",null.model="sample.taxa.labels")


