library(GGally)


### Name: ggnet
### Title: ggnet - Plot a network with ggplot2
### Aliases: ggnet

### ** Examples

library(network)

# random adjacency matrix
x           <- 10
ndyads      <- x * (x - 1)
density     <- x / ndyads
m           <- matrix(0, nrow = x, ncol = x)
dimnames(m) <- list(letters[ 1:x ], letters[ 1:x ])
m[ row(m) != col(m) ] <- runif(ndyads) < density
m

# random undirected network
n <- network::network(m, directed = FALSE)
n

ggnet(n, label = TRUE, alpha = 1, color = "white", segment.color = "black")

# random groups
g <- sample(letters[ 1:3 ], 10, replace = TRUE)

# color palette
p <- c("a" = "steelblue", "b" = "forestgreen", "c" = "tomato")

ggnet(n, node.group = g, node.color = p, label = TRUE, color = "white")

# edge arrows on a directed network
ggnet(network(m, directed = TRUE), arrow.gap = 0.05, arrow.size = 10)



