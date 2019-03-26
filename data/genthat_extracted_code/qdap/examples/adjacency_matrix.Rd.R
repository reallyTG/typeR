library(qdap)


### Name: adjacency_matrix
### Title: Takes a Matrix and Generates an Adjacency Matrix
### Aliases: adjacency_matrix adjmat
### Keywords: Boolean-matrix adjacency-matrix,

### ** Examples

## Not run: 
##D words <- c(" you", " the", "it", "oo")
##D Terms <- with(DATA, termco(state, list(sex, adult), words))
##D Terms
##D adjacency_matrix(Terms)
##D 
##D wordLIST <- c(" montague", " capulet", " court", " marry")
##D raj.termco <- with(raj.act.1, termco(dialogue, person, wordLIST))
##D raj.adjmat <- adjmat(raj.termco)
##D names(raj.adjmat)  #see what's available from the adjacency_matrix object
##D library(igraph)
##D g <- graph.adjacency(raj.adjmat$adjacency, weighted=TRUE, mode ="undirected")
##D g <- simplify(g)
##D V(g)$label <- V(g)$name
##D V(g)$degree <- degree(g)
##D plot(g, layout=layout.auto(g))
## End(Not run)



