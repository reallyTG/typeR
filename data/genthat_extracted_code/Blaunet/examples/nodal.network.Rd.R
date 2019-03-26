library(Blaunet)


### Name: nodal.network
### Title: Computes nodal spanners
### Aliases: nodal.network

### ** Examples

data(BSANet)
el <- BSANet$el
square.data <- BSANet$square.data
b <- blau(square.data, node.ids = 'person', ecology.ids = 'city', graph = el)
#will automatically compute niches
b <- nodal.network(b, dev.range = rep(1.5, 3)) # 3 is the number of dimensions




