library(GGally)


### Name: ggnet2
### Title: ggnet2 - Plot a network with ggplot2
### Aliases: ggnet2

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

ggnet2(n, label = TRUE)
ggnet2(n, label = TRUE, shape = 15)
ggnet2(n, label = TRUE, shape = 15, color = "black", label.color = "white")

# add vertex attribute
x = network.vertex.names(n)
x = ifelse(x %in% c("a", "e", "i"), "vowel", "consonant")
n %v% "phono" = x

ggnet2(n, color = "phono")
ggnet2(n, color = "phono", palette = c("vowel" = "gold", "consonant" = "grey"))
ggnet2(n, shape = "phono", color = "phono")

if (require(RColorBrewer)) {

  # random groups
  n %v% "group" <- sample(LETTERS[1:3], 10, replace = TRUE)

  ggnet2(n, color = "group", palette = "Set2")

}

# random weights
n %e% "weight" <- sample(1:3, network.edgecount(n), replace = TRUE)
ggnet2(n, edge.size = "weight", edge.label = "weight")

# edge arrows on a directed network
ggnet2(network(m, directed = TRUE), arrow.gap = 0.05, arrow.size = 10)

# Padgett's Florentine wedding data
data(flo, package = "network")
flo

ggnet2(flo, label = TRUE)
ggnet2(flo, label = TRUE, label.trim = 4, vjust = -1, size = 3, color = 1)
ggnet2(flo, label = TRUE, size = 12, color = "white")



