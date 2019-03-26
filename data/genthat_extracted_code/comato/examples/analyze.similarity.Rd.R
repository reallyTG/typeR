library(comato)


### Name: analyze.similarity
### Title: Analyzing graph similarity.
### Aliases: analyze.similarity

### ** Examples

require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(15, 0.7, type="gnp"), "name", value=1:15)
g2 = set.vertex.attribute(erdos.renyi.game(15, 0.7, type="gnp"), "name", value=1:15)
analyze.similarity(conceptmap(g1), conceptmap(g2))



