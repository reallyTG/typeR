library(MXM)


### Name: Ancestors and descendants of a node in a directed graph
### Title: Returns and plots, if asked, the descendants or ancestors of one
###   or all node(s) (or variable(s))
### Aliases: findDescendants findAncestors
### Keywords: Ancestors Descendants

### ** Examples

# simulate a dataset with continuous data
# simulate a dataset with continuous data
y = rdag(1000, 10, 0.3)
tru = y$G 
x = y$x
mod = pc.con(x)
G = pc.or(mod)$G
plotnetwork(G)
findDescendants(G, 4, graph = FALSE)
findAncestors(G, 4, graph = FALSE)
findAncestors(G)



