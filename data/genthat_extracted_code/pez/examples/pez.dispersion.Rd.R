library(pez)


### Name: pez.dispersion
### Title: Calculate (phylogenetic) dispersion: examine assemblages in the
###   context of a source pools
### Aliases: pez.dispersion

### ** Examples

data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits)
## Not run: pez.dispersion(data)
pez.dispersion(data, permute = 100)



