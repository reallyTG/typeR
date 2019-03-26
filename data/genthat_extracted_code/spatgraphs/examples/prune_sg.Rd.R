library(spatgraphs)


### Name: prune_sg
### Title: Prune a graph
### Aliases: prune_sg

### ** Examples

x <- matrix(runif(50*2), ncol=2)
g <- spatgraph(x, "MST")
gp <- prune_sg(g, level = 2)
plot(g, x, lty=2)
plot(gp, x, add=TRUE, col=2)




