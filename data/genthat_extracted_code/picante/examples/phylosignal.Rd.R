library(picante)


### Name: phylosignal
### Title: Measure phylogenetic signal
### Aliases: phylosignal
### Keywords: univar

### ** Examples

## No test: 
randtree <- rcoal(20)
randtraits <- rTraitCont(randtree)
phylosignal(randtraits[randtree$tip.label],randtree)
## End(No test)



