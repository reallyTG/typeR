library(rsppfp)


### Name: direct_graph
### Title: Undirected Graph Translator
### Aliases: direct_graph

### ** Examples

# Obtain the graph from any way
graph <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"), 
                    to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                    cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
                    stringsAsFactors = FALSE)
graph                    

# Translate it
digraph <- direct_graph(graph)
digraph





