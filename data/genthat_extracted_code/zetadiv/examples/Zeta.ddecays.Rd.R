library(zetadiv)


### Name: Zeta.ddecays
### Title: Zeta distance decay for a range of numbers of assemblages or
###   sites
### Aliases: Zeta.ddecays

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]

dev.new()
zeta.ddecays.bird <- Zeta.ddecays(xy.bird, data.spec.bird, sam = 100, orders = 2:5,
    plot = TRUE, confint.level = 0.95)

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

dev.new()
zeta.ddecays.marion <- Zeta.ddecays(xy.marion, data.spec.marion, sam = 100,
   orders = 2:5, plot = TRUE, confint.level = 0.95)




