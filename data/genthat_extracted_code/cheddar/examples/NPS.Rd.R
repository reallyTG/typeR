library(cheddar)


### Name: NPS
### Title: Node properties
### Aliases: NPS
### Keywords: utilities

### ** Examples

data(TL84) 
NPS(TL84) 

NPS(TL84, 'M') 

# Biomass is a function
NPS(TL84, 'Biomass') 

NPS(TL84, c(B='Biomass'))

# Several first-class and computed properties
NPS(TL84, c('M', 'N', B='Biomass', 'TrophicSpecies', 
            TL='PreyAveragedTrophicLevel'))

# Pass parameters to functions
NPS(TL84, list(TS1='TrophicSpecies', 
               TS2=list('TrophicSpecies', include.isolated=FALSE), 
               Iso='IsIsolatedNode'))



