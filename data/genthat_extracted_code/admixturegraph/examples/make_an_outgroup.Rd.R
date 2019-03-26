library(admixturegraph)


### Name: make_an_outgroup
### Title: Make an outgroup.
### Aliases: make_an_outgroup

### ** Examples

## No test: 
# Here is a little family tree of some dinosaur-like animals.

species <- c("triceratops", "crocodile", "diplodocus", "tyrannosaurus", "chicken")
graph <- five_leaves_graphs[[1]](species)
plot(graph)

# Of course we know that while this is correct as an undirected graph, "crocodile"
# should really be the outgroup.

graph <- make_an_outgroup(graph, "crocodile")
plot(graph)

# Strictly speaking the graph is still a little misleading because unfortunately
# the (non-bird) dinosaurs are extinct :-(
## End(No test)




