library(Rphylopars)


### Name: anc.recon
### Title: Ultra-fast maximum likelihood ancestral state reconstruction
### Aliases: anc.recon

### ** Examples

require(ape)
tree <- rtree(10000) # random tree with 10,000 taxa
x <- setNames(rnorm(1e4),tree$tip.label) # random trait data
recon <- anc.recon(trait_data=x,tree=tree)



