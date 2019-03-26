library(Claddis)


### Name: TrimMorphDistMatrix
### Title: Trims a morphological distance matrix
### Aliases: TrimMorphDistMatrix

### ** Examples


# Get morphological distances for Michaux (1989) data set:
distances <- MorphDistMatrix(Michaux1989)

# Attempt to trim max.dist.matrix:
TrimMorphDistMatrix(distances$DistanceMatrix)




