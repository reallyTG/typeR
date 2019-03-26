library(ggnetwork)


### Name: geom_nodetext
### Title: Label the nodes of a network.
### Aliases: geom_nodelabel geom_nodetext

### ** Examples

## geom_nodetext examples

if (require(network) && require(sna)) {

n <- network(rgraph(10, tprob = 0.2), directed = FALSE)

# just node labels
ggplot(n, aes(x, y)) +
  geom_nodetext(aes(label = vertex.names)) +
  theme_blank()

# with nodes underneath
ggplot(n, aes(x, y)) +
  geom_nodes(color = "gold", size = 9) +
  geom_nodetext(aes(label = vertex.names)) +
  theme_blank()

# with nodes and edges
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "gold") +
  geom_nodes(color = "gold", size = 9) +
  geom_nodetext(aes(label = vertex.names)) +
  theme_blank()

}

## geom_nodelabel examples

if (require(network) && require(sna)) {

data(flo, package = "network")
n <- network(flo, directed = FALSE)

# with text labels
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "grey50") +
  geom_nodelabel(aes(label = vertex.names)) +
  theme_blank()

# with text labels coloured according to degree centrality
n %v% "degree" <- degree(n)
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "grey50") +
  geom_nodelabel(aes(label = vertex.names, fill = degree)) +
  scale_fill_gradient(low = "gold", high = "tomato") +
  theme_blank()

# label only a subset of all nodes
high_degree <- function(x) { x[ x$degree > median(x$degree), ] }
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "steelblue") +
  geom_nodes(aes(size = degree), color = "steelblue") +
  geom_nodelabel(aes(label = vertex.names), data = high_degree,
                 color = "white", fill = "tomato") +
  theme_blank()
}




