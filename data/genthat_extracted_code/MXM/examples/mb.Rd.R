library(MXM)


### Name: Markov Blanket of a node in a directed graph
### Title: Returns the Markov blanket of a node (or variable)
### Aliases: mb
### Keywords: Network plot Neighbour nodes

### ** Examples

# simulate a dataset with continuous data
# simulate a dataset with continuous data
y <- rdag(1000, 10, 0.3)
tru <- y$G 
x <- y$x
mod <- pc.con(x)
G <- pc.or(mod)$G
plotnetwork(G)
dev.new()
mb(G, 8)



