library(stemmatology)


### Name: layout_as_stemma
### Title: layout_as_stemma
### Aliases: layout_as_stemma
### Keywords: stemmatology graphs

### ** Examples

edgelist = structure(
    c("{ABC}", "{ABC}", "{ABC}", "D", "A","A","G",
        "A", "B", "C", "E", "F","G","H",
        1,5,3,10,3,4,5), .Dim = c(7L, 3L)
  )
g = igraph::graph_from_edgelist(edgelist[,1:2], directed = TRUE)
layout = layout_as_stemma(edgelist)
plot(g, layout = layout)



