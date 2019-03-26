library(Blaunet)


### Name: dyadic
### Title: Computes dyadic Blau status measures.
### Aliases: dyadic

### ** Examples

data(BSANet)
square.data <- BSANet$square.data
el <- BSANet$el #edgelist
adj <- BSANet$adj #adjacency matrix

b <- blau(square.data, node.ids = 'person', ecology.ids = 'city', graph = el)
#implicitly a directed edgelist
#will automatically compute niches
b <- dyadic(b, dev.range = rep(1.5, 3)) # 3 is the number of dimensions

#adjacency matricies are also OK
b <- blau(square.data, node.ids = 'person', ecology.ids = 'city', graph = adj)
#will automatically compute niches
b <- dyadic(b, dev.range = rep(1.5, 3)) # 3 is the number of dimensions




