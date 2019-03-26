library(zetadiv)


### Name: Plot.zeta.ddecay
### Title: Zeta distance-decay plotting
### Aliases: Plot.zeta.ddecay

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]

dev.new()
zeta.ddecay.bird <- Zeta.ddecay(xy.bird, data.spec.bird, sam = 100, order = 3,
    confint.level = 0.95,plot=FALSE)
Plot.zeta.ddecay(zeta.ddecay.bird)

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

zeta.ddecay.marion <- Zeta.ddecay(xy.marion, data.spec.marion, sam = 100, order = 3,
    confint.level = 0.95, trsf = "log", normalize = "Jaccard",plot=FALSE)
dev.new()
Plot.zeta.ddecay(zeta.ddecay.marion)




