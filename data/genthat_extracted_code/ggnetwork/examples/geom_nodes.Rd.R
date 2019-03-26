library(ggnetwork)


### Name: geom_nodes
### Title: Draw the nodes of a network.
### Aliases: geom_nodes

### ** Examples

if (require(network) && require(sna)) {

data(flo, package = "network")
n <- network(flo, directed = FALSE)

# just nodes
ggplot(n, aes(x, y)) +
  geom_nodes(size = 3, shape = 21, color = "steelblue") +
  theme_blank()

# with edges
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "steelblue") +
  geom_nodes(size = 3, shape = 21, color = "steelblue", fill = "white") +
  theme_blank()

# with nodes sized according to degree centrality
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "steelblue") +
  geom_nodes(size = degree(n), shape = 21, color = "steelblue", fill = "white") +
  theme_blank()

# with nodes colored according to betweenness centrality

n %v% "betweenness" <- betweenness(flo)
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "grey50") +
  geom_nodes(aes(color = betweenness), size = 3) +
  scale_color_gradient(low = "gold", high = "tomato") +
  theme_blank() +
  theme(legend.position = "bottom")

}



