library(zetadiv)


### Name: Zeta.scale.min.dist
### Title: Zeta diversity scaling with sample grain dependency based on the
###   minimum distance between sites
### Aliases: Zeta.scale.min.dist

### ** Examples

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

dev.new()
zeta.scale.irreg.species <- Zeta.scale.min.dist(xy.marion, data.spec.marion, m = 1:3,
    order = 3, reorder = 3, sam = 50, normalize = "Jaccard")




