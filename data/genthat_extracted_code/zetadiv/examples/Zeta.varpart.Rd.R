library(zetadiv)


### Name: Zeta.varpart
### Title: Variation partitioning for zeta diversity
### Aliases: Zeta.varpart

### ** Examples

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]
utils::data(bird.env.coarse)
data.env.bird <- bird.env.coarse[,3:9]

zeta.bird <- Zeta.msgdm(data.spec.bird, data.env.bird, xy.bird, sam = 100, order = 3)
zeta.varpart.bird <- Zeta.varpart(zeta.bird, method.glm = "glm.fit2")
zeta.varpart.bird
dev.new()
pie.neg(zeta.varpart.bird[4:7,1], density = c(4, 0, 8, -1),
    angle = c(90, 0, 0, 0),
    labels = c("distance", "undistinguishable", "environment", "unexplained"),
    radius = 0.9)

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]
utils::data(Marion.env)
data.env.marion <- Marion.env[3:4]

zeta.marion <- Zeta.msgdm(data.spec.marion, data.env.marion, xy.marion, sam = 100,
    order = 3, normalize = "Jaccard")
zeta.varpart.marion <- Zeta.varpart(zeta.marion, method.glm = "glm.fit2")
zeta.varpart.marion
dev.new()
pie.neg(zeta.varpart.marion[4:7,1], density = c(4, 0, 8, -1),
    angle = c(90, 0, 0, 0),
    labels = c("distance", "undistinguishable", "environment", "unexplained"),
    radius = 0.9)




