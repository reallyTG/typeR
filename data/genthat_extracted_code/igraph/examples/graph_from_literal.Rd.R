library(igraph)


### Name: graph_from_literal
### Title: Creating (small) graphs via a simple interface
### Aliases: graph_from_literal graph.formula from_literal

### ** Examples

# A simple undirected graph
g <- graph_from_literal( Alice-Bob-Cecil-Alice, Daniel-Cecil-Eugene,
                     Cecil-Gordon )
g

# Another undirected graph, ":" notation
g2 <- graph_from_literal( Alice-Bob:Cecil:Daniel, Cecil:Daniel-Eugene:Gordon )
g2

# A directed graph
g3 <- graph_from_literal( Alice +-+ Bob --+ Cecil +-- Daniel,
                     Eugene --+ Gordon:Helen )
g3

# A graph with isolate vertices
g4 <- graph_from_literal( Alice -- Bob -- Daniel, Cecil:Gordon, Helen )
g4
V(g4)$name

# "Arrows" can be arbitrarily long
g5 <- graph_from_literal( Alice +---------+ Bob )
g5

# Special vertex names
g6 <- graph_from_literal( "+" -- "-", "*" -- "/", "%%" -- "%/%" )
g6




