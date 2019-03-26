library(nat.nblast)


### Name: nblast_allbyall
### Title: Wrapper function to compute all by all NBLAST scores for a set
###   of neurons
### Aliases: nblast_allbyall nblast_allbyall.character
###   nblast_allbyall.neuronlist

### ** Examples

library(nat)
kcs20.scoremat=nblast_allbyall(kcs20)
kcs20.hclust=nhclust(scoremat=kcs20.scoremat)
plot(kcs20.hclust)



