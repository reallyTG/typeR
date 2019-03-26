library(zetadiv)


### Name: Plot.zeta.ddecays
### Title: Zeta distance-decay plotting for multiple orders
### Aliases: Plot.zeta.ddecays

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]

dev.new()
zeta.ddecays.bird <- Zeta.ddecays(xy.bird, data.spec.bird, sam = 100, orders = 2:5,
    plot = FALSE, confint.level = 0.95)
Plot.zeta.ddecays(zeta.ddecays.bird)

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

dev.new()
zeta.ddecays.marion <- Zeta.ddecays(xy.marion, data.spec.marion, sam = 100,
   orders = 2:5, plot = FALSE, confint.level = 0.95)
Plot.zeta.ddecays(zeta.ddecays.marion)




