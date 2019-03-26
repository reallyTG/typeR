library(mcMST)


### Name: getWeight
### Title: Get the overall costs/weight of a subgraph given its edgelist.
### Aliases: getWeight

### ** Examples

# generate a random bi-objective graph
g = genRandomMCGP(5)

# generate a random Pruefer code, i.e., a random spanning tree of g
pcode = sample(1:5, 3, replace = TRUE)

getWeight(g, prueferToEdgeList(pcode))



