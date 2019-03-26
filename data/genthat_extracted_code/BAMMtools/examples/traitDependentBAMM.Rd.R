library(BAMMtools)


### Name: traitDependentBAMM
### Title: STRAPP: STructured Rate Permutations on Phylogenies
### Aliases: strapp traitDependentBAMM
### Keywords: nonparametric

### ** Examples

# using a small subset of the fish data set (300 taxa) in Rabosky et al.
# 2013. Nat. Com. paper
data(fishes, events.fishes)
xx <- getEventData(phy = fishes, eventdata = events.fishes, 
      nsamples = 500, type = "diversification")
# traits.fishes is the trait -- body size
data(traits.fishes)
x <- traitDependentBAMM(ephy = xx, traits = traits.fishes, reps = 1000,
                        return.full = TRUE, method = 's', logrates = TRUE,
                        two.tailed = TRUE)



