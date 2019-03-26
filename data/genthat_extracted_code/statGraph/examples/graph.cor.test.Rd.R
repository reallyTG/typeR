library(statGraph)


### Name: graph.cor.test
### Title: Test for Association / Correlation Between Paired Samples of
###   Graphs
### Aliases: graph.cor.test
### Keywords: correlation_coefficient

### ** Examples

require(igraph)
x <- list()
y <- list()

p <- MASS::mvrnorm(50, mu=c(0,0), Sigma=matrix(c(1, 0.5, 0.5, 1), 2, 2))

ma <- max(p)
mi <- min(p)
p[,1] <- (p[,1] - mi)/(ma - mi)
p[,2] <- (p[,2] - mi)/(ma - mi)

for (i in 1:50) {
    x[[i]] <- get.adjacency(erdos.renyi.game(50, p[i,1]))
    y[[i]] <- get.adjacency(erdos.renyi.game(50, p[i,2]))
}

graph.cor.test(x, y)




