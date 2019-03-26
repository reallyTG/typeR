library(motmot.2.0)


### Name: dropTipPartial
### Title: Drop tips from a phylogenetic tree while preserving deleted
###   nodes
### Aliases: dropTipPartial

### ** Examples

## Read in phylogeny and data from Thomas et al. (2009)
data(anolis.tree)
data(anolis.data)
## identify tips to drop
tips.to.go <- anolis.tree$tip.label[1:30]
dropTipPartial(phy=anolis.tree, tip=tips.to.go)



