library(zetadiv)


### Name: Plot.zeta.scale.min.dist
### Title: Plotting of zeta diversity scaling with sample grain dependency
###   based on the minimum distance between sites
### Aliases: Plot.zeta.scale.min.dist

### ** Examples

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

zeta.scale.irreg.species <- Zeta.scale.min.dist(xy.marion, data.spec.marion, m = 1:3,
    order = 3, reorder = 3, sam = 50, normalize = "Jaccard",plot=FALSE)
dev.new()
Plot.zeta.scale.min.dist(zeta.scale.irreg.species)



