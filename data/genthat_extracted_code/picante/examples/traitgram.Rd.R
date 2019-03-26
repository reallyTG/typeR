library(picante)


### Name: traitgram
### Title: Draw phylogeny with nodes at trait positions
### Aliases: traitgram
### Keywords: univar

### ** Examples

randtree <- rcoal(20)
randtraits <- rTraitCont(randtree)
traitgram(randtraits,randtree)
traitgram(randtraits,randtree,method='pic')



