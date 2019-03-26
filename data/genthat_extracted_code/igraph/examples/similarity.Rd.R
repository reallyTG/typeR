library(igraph)


### Name: similarity
### Title: Similarity measures of two vertices
### Aliases: similarity similarity.jaccard similarity.dice
###   similarity.invlogweighted
### Keywords: graphs

### ** Examples


g <- make_ring(5)
similarity(g, method = "dice")
similarity(g, method = "jaccard")



