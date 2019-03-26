library(zetadiv)


### Name: Zeta.order.ex
### Title: Expectation of zeta diversity for a specific number of
###   assemblages or sites
### Aliases: Zeta.order.ex

### ** Examples


utils::data(bird.spec.coarse)
data.spec.bird <- bird.spec.coarse[,3:193]

zeta.bird <- Zeta.order.ex(data.spec.bird, order = 3)
zeta.bird

##########

utils::data(Marion.species)
data.spec.marion <- Marion.species[,3:33]

zeta.marion <- Zeta.order.ex(data.spec.marion, order = 3)
zeta.marion




