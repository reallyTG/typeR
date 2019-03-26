library(zetadiv)


### Name: Zeta.decline.ex
### Title: Expectation of zeta diversity decline
### Aliases: Zeta.decline.ex

### ** Examples

utils::data(bird.spec.coarse)
data.spec.bird <- bird.spec.coarse[,3:193]

dev.new(width = 12, height = 4)
zeta.bird <- Zeta.decline.ex(data.spec.bird, orders = 1:5)
zeta.bird

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

dev.new(width = 12, height = 4)
zeta.marion <- Zeta.decline.ex(data.spec.marion, orders = 1:5)
zeta.marion




