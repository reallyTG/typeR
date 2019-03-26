library(mathgraph)


### Name: mathgraph
### Title: Create Mathematical Graph
### Aliases: mathgraph [.mathgraph [<-.mathgraph length.mathgraph
###   c.mathgraph is.mathgraph
### Keywords: math

### ** Examples


mathgraph(~ 1:3 / 2:4) # graph with 3 edges
mathgraph(~ 1:3 * 2:4) # graph with 9 edges

mathgraph(~ 1:3 / 2:4, dir=TRUE) # directed graph with 3 edges

# graph with some edges directed, some not
c(mathgraph(~ 1:3 * 2:4), mathgraph(~ c(3,1) / c(2,4), dir=TRUE))




