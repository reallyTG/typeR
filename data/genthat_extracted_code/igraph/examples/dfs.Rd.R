library(igraph)


### Name: dfs
### Title: Depth-first search
### Aliases: dfs graph.dfs
### Keywords: graphs

### ** Examples


## A graph with two separate trees
dfs(make_tree(10) %du% make_tree(10), root=1, "out",
          TRUE, TRUE, TRUE, TRUE)

## How to use a callback
f.in <- function(graph, data, extra) {
  cat("in:", paste(collapse=", ", data), "\n")
  FALSE
}
f.out <- function(graph, data, extra) {
  cat("out:", paste(collapse=", ", data), "\n")
  FALSE
}
tmp <- dfs(make_tree(10), root=1, "out",
                 in.callback=f.in, out.callback=f.out)

## Terminate after the first component, using a callback
f.out <- function(graph, data, extra) {
 data['vid'] == 1
}
tmp <- dfs(make_tree(10) %du% make_tree(10), root=1,
                 out.callback=f.out)





