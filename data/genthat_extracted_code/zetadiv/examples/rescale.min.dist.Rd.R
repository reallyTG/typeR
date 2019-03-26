library(zetadiv)


### Name: rescale.min.dist
### Title: Rescaling of data based on the minimum distance between sites
### Aliases: rescale.min.dist

### ** Examples

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

data.rescale <- rescale.min.dist(xy.marion, data.spec.marion, m=2)




