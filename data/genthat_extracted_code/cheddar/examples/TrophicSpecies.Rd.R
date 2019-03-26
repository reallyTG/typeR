library(cheddar)


### Name: TrophicSpecies
### Title: Trophic species
### Aliases: TrophicSpecies
### Keywords: utilities

### ** Examples

data(TL84)

# Isolated nodes assigned their own trophic species number
TrophicSpecies(TL84)

# Isolated nodes assigned a trophic species of NA
TrophicSpecies(TL84, include.isolated=FALSE)

# Compare including and excluding isolated nodes
NPS(TL84, list(TS1='TrophicSpecies', 
               TS2=list('TrophicSpecies', include.isolated=FALSE), 
               Iso='IsIsolatedNode'))



