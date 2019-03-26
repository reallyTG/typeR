library(cheddar)


### Name: LumpTrophicSpecies
### Title: Lump trophic species
### Aliases: LumpTrophicSpecies
### Keywords: utilities

### ** Examples

data(TL84)
NumberOfNodes(TL84)

TL84.lumped <- LumpTrophicSpecies(TL84)

length(unique(TrophicSpecies(TL84)))    # 22 trophic species in TL84...
NumberOfNodes(TL84.lumped)              # ... and 22 nodes in the lumped web



