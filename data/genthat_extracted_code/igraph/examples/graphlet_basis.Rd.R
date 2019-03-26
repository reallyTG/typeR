library(igraph)


### Name: graphlet_basis
### Title: Graphlet decomposition of a graph
### Aliases: graphlet_basis graphlets graphlets.project graphlet_proj
###   graphlets.candidate.basis graphlet_proj

### ** Examples


## Create an example graph first
D1 <- matrix(0, 5, 5)
D2 <- matrix(0, 5, 5)
D3 <- matrix(0, 5, 5)
D1[1:3, 1:3] <- 2
D2[3:5, 3:5] <- 3
D3[2:5, 2:5] <- 1
  
g <- simplify(graph_from_adjacency_matrix(D1 + D2 + D3,
      mode="undirected", weighted=TRUE))
V(g)$color <- "white"
E(g)$label <- E(g)$weight
E(g)$label.cex <- 2
E(g)$color <- "black"
layout(matrix(1:6, nrow=2, byrow=TRUE))
co <- layout_with_kk(g)
par(mar=c(1,1,1,1))
plot(g, layout=co)

## Calculate graphlets
gl <- graphlets(g, niter=1000)

## Plot graphlets
for (i in 1:length(gl$cliques)) {
  sel <- gl$cliques[[i]]
  V(g)$color <- "white"
  V(g)[sel]$color <- "#E495A5"
  E(g)$width <- 1
  E(g)[ V(g)[sel] %--% V(g)[sel] ]$width <- 2
  E(g)$label <- ""
  E(g)[ width == 2 ]$label <- round(gl$Mu[i], 2)
  E(g)$color <- "black"
  E(g)[ width == 2 ]$color <- "#E495A5"
  plot(g, layout=co)
}



