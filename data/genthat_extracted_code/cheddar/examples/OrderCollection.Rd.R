library(cheddar)


### Name: OrderCollection
### Title: Order a collection of communities
### Aliases: OrderCollection
### Keywords: utilities

### ** Examples

data(pHWebs)
CollectionCPS(pHWebs, c('pH', 'NumberOfNodes'))

# Order by name
pHWebs.name <- OrderCollection(pHWebs, 'title')
CollectionCPS(pHWebs.name, c('pH', 'NumberOfNodes'))

# Order by decreasing pH
pHWebs.decreasing.pH <- OrderCollection(pHWebs, 'pH', decreasing=TRUE)
CollectionCPS(pHWebs.decreasing.pH, c('pH', 'NumberOfNodes'))

# Order by increasing diversity
pHWebs.increasing.S <- OrderCollection(pHWebs, 'NumberOfNodes')
CollectionCPS(pHWebs.increasing.S, c('pH', 'NumberOfNodes'))



