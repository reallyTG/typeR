library(igraph)


### Name: which_multiple
### Title: Find the multiple or loop edges in a graph
### Aliases: which_multiple has.multiple is.loop is.multiple count.multiple
###   count_multiple any_multiple which_loop
### Keywords: graphs

### ** Examples


# Loops
g <- graph( c(1,1,2,2,3,3,4,5) )
which_loop(g)

# Multiple edges
g <- barabasi.game(10, m=3, algorithm="bag")
any_multiple(g)
which_multiple(g)
count_multiple(g)
which_multiple(simplify(g))
all(count_multiple(simplify(g)) == 1)

# Direction of the edge is important
which_multiple(graph( c(1,2, 2,1) ))
which_multiple(graph( c(1,2, 2,1), dir=FALSE ))

# Remove multiple edges but keep multiplicity
g <- barabasi.game(10, m=3, algorithm="bag")
E(g)$weight <- count_multiple(g)
g <- simplify(g)
any(which_multiple(g))
E(g)$weight




