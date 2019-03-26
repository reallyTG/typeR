library(ggnetwork)


### Name: geom_edges
### Title: Draw the edges of a network.
### Aliases: geom_edges

### ** Examples

if (require(network) && require(sna)) {

# rerun if the example does not produce reciprocated ties
n <- network(rgraph(10, tprob = 0.2), directed = TRUE)

# just edges
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(size = 1, color = "steelblue") +
  theme_blank()

# with nodes
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(size = 1, color = "steelblue") +
  geom_nodes(size = 3, color = "steelblue") +
  theme_blank()

# with arrows
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(size = 1, color = "steelblue",
             arrow = arrow(length = unit(0.5, "lines"), type = "closed")) +
  geom_nodes(size = 3, color = "steelblue") +
  theme_blank()

# with curvature
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(size = 1, color = "steelblue", curvature = 0.15,
             arrow = arrow(length = unit(0.5, "lines"), type = "closed")) +
  geom_nodes(size = 3, color = "steelblue") +
  theme_blank()

# arbitrary categorical edge attribute
e <- sample(letters[ 1:2 ], network.edgecount(n), replace = TRUE)
set.edge.attribute(n, "type", e)
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(aes(linetype = type), size = 1, curvature = 0.15,
             arrow = arrow(length = unit(0.5, "lines"), type = "closed")) +
  geom_nodes(size = 3, color = "steelblue") +
  theme_blank()

# arbitrary numeric edge attribute (signed network)
e <- sample(-2:2, network.edgecount(n), replace = TRUE)
set.edge.attribute(n, "weight", e)
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(aes(color = weight), curvature = 0.15,
             arrow = arrow(length = unit(0.5, "lines"), type = "closed")) +
  geom_nodes(size = 3, color = "grey50") +
  scale_color_gradient(low = "steelblue", high = "tomato") +
  theme_blank()

# draw only a subset of all edges
positive_weight <- function(x) { x[ x$weight >= 0, ] }
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(aes(color = weight), data = positive_weight) +
  geom_nodes(size = 4, color = "grey50") +
  scale_color_gradient(low = "gold", high = "tomato") +
  theme_blank()

}



