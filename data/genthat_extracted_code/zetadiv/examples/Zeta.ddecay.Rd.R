library(zetadiv)


### Name: Zeta.ddecay
### Title: Zeta distance decay for a specific number of assemblages or
###   sites
### Aliases: Zeta.ddecay

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]

dev.new()
zeta.ddecay.bird <- Zeta.ddecay(xy.bird, data.spec.bird, sam = 100, order = 3,
    method.glm = "glm.fit2", confint.level = 0.95)

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

dev.new()
zeta.ddecay.marion <- Zeta.ddecay(xy.marion, data.spec.marion, sam = 100, order = 3,
    method.glm = "glm.fit2", confint.level = 0.95, trsf = "log", normalize = "Jaccard")




