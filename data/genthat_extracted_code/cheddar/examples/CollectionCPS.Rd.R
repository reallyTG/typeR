library(cheddar)


### Name: CollectionCPS
### Title: Collection community properties
### Aliases: CollectionCPS
### Keywords: utilities

### ** Examples

data(pHWebs)

CollectionCPS(pHWebs)

# pH and a computed property
CollectionCPS(pHWebs, c('pH', 'NumberOfNodes'))

# A shorter name for the 'NumberOfNodes' column
CollectionCPS(pHWebs, c('pH', S='NumberOfNodes'))

# A function that returns more than one value. Some pHWebs communities contain 
# nodes (detritus and the like) that do not have a category. These appear in 
# <unnamed>.
CollectionCPS(pHWebs, 'SumBiomassByClass')

# Prefix columns with 'B'
CollectionCPS(pHWebs, c(B='SumBiomassByClass'))

# Remove biomasses of NA
CollectionCPS(pHWebs, list(B=list('SumBiomassByClass', na.rm=TRUE)))



