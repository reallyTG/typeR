library(cheddar)


### Name: CollectionTLPS
### Title: Collection trophic-link properties
### Aliases: CollectionTLPS
### Keywords: utilities

### ** Examples

data(pHWebs)

# Just community, resource and consumer
head(CollectionTLPS(pHWebs), 10)

# The M of the resource and consumer in each link
head(CollectionTLPS(pHWebs, node.properties='M'), 10)



