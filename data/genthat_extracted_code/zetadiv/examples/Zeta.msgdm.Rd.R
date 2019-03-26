library(zetadiv)


### Name: Zeta.msgdm
### Title: Multi-site generalised dissimilarity modelling for a set of
###   environmental variables and distances
### Aliases: Zeta.msgdm

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[1:2]
data.spec.bird <- bird.spec.coarse[3:193]
utils::data(bird.env.coarse)
data.env.bird <- bird.env.coarse[,3:9]

zeta.glm <- Zeta.msgdm(data.spec.bird, data.env.bird, sam = 100, order = 3)
zeta.glm
dev.new()
graphics::plot(zeta.glm$model)

zeta.ngls <- Zeta.msgdm(data.spec.bird, data.env.bird, xy.bird, sam = 100, order = 3,
    reg.type = "ngls", rescale = TRUE)
zeta.ngls

##########

utils::data(Marion.species)
xy.marion <- Marion.species[1:2]
data.spec.marion <- Marion.species[3:33]
utils::data(Marion.env)
data.env.marion <- Marion.env[3]

zeta.gam <- Zeta.msgdm(data.spec.marion, data.env.marion, sam = 100, order = 3,
    reg.type = "gam")
zeta.gam
dev.new()
graphics::plot(zeta.gam$model)

zeta.ispline <- Zeta.msgdm(data.spec.marion, data.env.marion, xy.marion, sam = 100,
    order = 3, normalize = "Jaccard", reg.type = "ispline")
zeta.ispline




