library(BNSL)


### Name: kruskal
### Title: Given a weight matrix, generate its maximum weight forest
### Aliases: kruskal

### ** Examples

library(igraph)
library(bnlearn)
df=asia
mi.mat=mi_matrix(df)
edge.list=kruskal(mi.mat)
edge.list
g=graph_from_edgelist(edge.list, directed=FALSE)
V(g)$label=colnames(df)
plot(g)



