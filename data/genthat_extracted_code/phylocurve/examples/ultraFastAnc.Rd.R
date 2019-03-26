library(phylocurve)


### Name: ultraFastAnc
### Title: Ultra-fast maximum likelihood ancestral state reconstruction
### Aliases: ultraFastAnc
### Keywords: ~kwd1 ~kwd2

### ** Examples

require(ape)
tree <- rtree(1e4) # random tree with 10,000 taxa
x <- setNames(rnorm(1e4),tree$tip.label) # random trait data
recon <- ultraFastAnc(phy=tree,x=x,CI=TRUE)



