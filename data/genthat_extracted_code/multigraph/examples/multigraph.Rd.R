library(multigraph)


### Name: multigraph
### Title: Multigraphs and weighted multigraphs
### Aliases: multigraph
### Keywords: graphics

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 3 ) )

## Plot the multigraph of this network
multigraph(arr)

## Now with a force directed algorithm
multigraph(arr, layout = "force")

## As weighted graph
multigraph(arr, weighted = TRUE)

## As signed graph
multigraph(arr, signed = TRUE)

## With loops and a costumized vertex size
multigraph(arr, cex = 3, loops = TRUE)




