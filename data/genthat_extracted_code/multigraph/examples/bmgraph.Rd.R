library(multigraph)


### Name: bmgraph
### Title: Bipartite multigraph
### Aliases: bmgraph
### Keywords: graphics

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 3 ) )

## Plot this network as Bipartite graph
bmgraph(arr)

## Now with a Force Directed algorithm
bmgraph(arr, layout = "force")

## And with a Correspondence Analysis method
bmgraph(arr, layout = "CA", asp = NA)




