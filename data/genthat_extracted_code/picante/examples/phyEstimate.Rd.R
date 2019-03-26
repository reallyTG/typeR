library(picante)


### Name: phyEstimate
### Title: Phylogenetic estimation of traits for unobserved taxa
### Aliases: phyEstimate phyEstimateDisc
### Keywords: univar

### ** Examples

#generate random phylogeny
randtree <- rcoal(50)
#simulate trait evolution for a subset of taxa on phylogeny
randtraits <- sample(rTraitCont(randtree, sigma=10, root.value=100), 40)
#estimate trait values for "missing" taxa using PIC method
phyEstimate(randtree, randtraits, method="pic")



