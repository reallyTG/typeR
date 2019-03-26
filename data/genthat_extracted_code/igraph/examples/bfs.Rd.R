library(igraph)


### Name: bfs
### Title: Breadth-first search
### Aliases: bfs graph.bfs
### Keywords: graphs

### ** Examples


## Two rings
bfs(make_ring(10) %du% make_ring(10), root=1, "out",
          order=TRUE, rank=TRUE, father=TRUE, pred=TRUE,
          succ=TRUE, dist=TRUE)

## How to use a callback
f <- function(graph, data, extra) {
  print(data)
  FALSE
}
tmp <- bfs(make_ring(10) %du% make_ring(10), root=1, "out",
                 callback=f)

## How to use a callback to stop the search
## We stop after visiting all vertices in the initial component
f <- function(graph, data, extra) {
 data['succ'] == -1
}
bfs(make_ring(10) %du% make_ring(10), root=1, callback=f)





