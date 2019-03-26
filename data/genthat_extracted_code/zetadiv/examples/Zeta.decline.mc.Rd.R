library(zetadiv)


### Name: Zeta.decline.mc
### Title: Zeta diversity decline using Monte Carlo sampling
### Aliases: Zeta.decline.mc

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]

dev.new(width = 12, height = 4)
zeta.bird <- Zeta.decline.mc(data.spec.bird, xy.bird, orders = 1:5, sam = 100,
   NON = TRUE)
zeta.bird

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

dev.new(width = 12, height = 4)
zeta.marion <- Zeta.decline.mc(data.spec.marion, orders = 1:5, sam = 100,
     normalize = "Jaccard")
zeta.marion




