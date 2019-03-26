library(cheddar)


### Name: CollectionNPS
### Title: Collection node properties
### Aliases: CollectionNPS
### Keywords: utilities

### ** Examples

data(pHWebs) 
head(CollectionNPS(pHWebs), 10)

head(CollectionNPS(pHWebs, 'M'), 10)

# Biomass is a function
head(CollectionNPS(pHWebs, 'Biomass'), 10)

head(CollectionNPS(pHWebs, c(B='Biomass')), 10)

# Several first-class and computed properties
head(CollectionNPS(pHWebs, c('M', 'N', B='Biomass', 'TrophicSpecies', 
                             TL='PreyAveragedTrophicLevel')), 10)

# Pass parameters to functions
head(CollectionNPS(pHWebs, 
                   list(TS1='TrophicSpecies', 
                        TS2=list('TrophicSpecies', include.isolated=FALSE), 
                        Iso='IsIsolatedNode')), 10)



