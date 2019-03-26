library(igraph)


### Name: count_triangles
### Title: Find triangles in graphs
### Aliases: count_triangles adjacent.triangles triangles
### Keywords: graphs

### ** Examples


## A small graph
kite <- make_graph("Krackhardt_Kite")
plot(kite)
matrix(triangles(kite), nrow=3)

## Adjacenct triangles
atri <- count_triangles(kite)
plot(kite, vertex.label=atri)

## Always true
sum(count_triangles(kite)) == length(triangles(kite))

## Should match, local transitivity is the
## number of adjacent triangles divided by the number
## of adjacency triples
transitivity(kite, type="local")
count_triangles(kite) / (degree(kite) * (degree(kite)-1)/2)



