library(igraph)


### Name: contract
### Title: Contract several vertices into a single one
### Aliases: contract contract.vertices
### Keywords: graphs

### ** Examples


g <- make_ring(10)
g$name <- "Ring"
V(g)$name <- letters[1:vcount(g)]
E(g)$weight <- runif(ecount(g))

g2 <- contract(g, rep(1:5, each=2),
                        vertex.attr.comb=toString)

## graph and edge attributes are kept, vertex attributes are
## combined using the 'toString' function.
print(g2, g=TRUE, v=TRUE, e=TRUE)




