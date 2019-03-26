library(igraph)


### Name: transitivity
### Title: Transitivity of a graph
### Aliases: transitivity
### Keywords: graphs

### ** Examples


g <- make_ring(10)
transitivity(g)
g2 <- sample_gnp(1000, 10/1000)
transitivity(g2)   # this is about 10/1000

# Weighted version, the figure from the Barrat paper
gw <- graph_from_literal(A-B:C:D:E, B-C:D, C-D)
E(gw)$weight <- 1
E(gw)[ V(gw)[name == "A"] %--% V(gw)[name == "E" ] ]$weight <- 5
transitivity(gw, vids="A", type="local")
transitivity(gw, vids="A", type="weighted")

# Weighted reduces to "local" if weights are the same
gw2 <- sample_gnp(1000, 10/1000)
E(gw2)$weight <- 1
t1 <- transitivity(gw2, type="local")
t2 <- transitivity(gw2, type="weighted")
all(is.na(t1) == is.na(t2))
all(na.omit(t1 == t2))




