library(picante)


### Name: mntd
### Title: Mean nearest taxon distance
### Aliases: mntd mnnd
### Keywords: univar

### ** Examples

data(phylocom)
mntd(phylocom$sample, cophenetic(phylocom$phylo), abundance.weighted=TRUE)



