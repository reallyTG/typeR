library(picante)


### Name: Kcalc
### Title: K statistic of phylogenetic signal
### Aliases: Kcalc
### Keywords: univar

### ** Examples

## No test: 
randtree <- rcoal(20)
randtraits <- rTraitCont(randtree)
Kcalc(randtraits[randtree$tip.label],randtree)
## End(No test)



