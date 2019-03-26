library(zetadiv)


### Name: Zeta.order.mc
### Title: Zeta diversity for a specific number of assemblages or sites
###   using Monte Carlo sampling
### Aliases: Zeta.order.mc

### ** Examples


utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[,1:2]
data.spec.bird <- bird.spec.coarse[,3:193]

zeta.bird <- Zeta.order.mc(data.spec.bird, order = 3, sam=100)
zeta.bird

##########

utils::data(Marion.species)
xy.marion <- Marion.species[,1:2]
data.spec.marion <- Marion.species[,3:33]

zeta.marion <- Zeta.order.mc(data.spec.marion, xy.marion, order = 3, sam = 100,
   NON = TRUE)
zeta.marion




