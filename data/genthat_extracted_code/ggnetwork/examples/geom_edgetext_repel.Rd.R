library(ggnetwork)


### Name: geom_edgetext_repel
### Title: Draw repulsive edge labels.
### Aliases: geom_edgelabel_repel geom_edgetext_repel

### ** Examples

if (require(network) && require(sna)) {

data(flo, package = "network")
n <- network(flo, directed = FALSE)

# arbitrary categorical edge attribute
e <- sample(1:4, network.edgecount(n), replace = TRUE)
set.edge.attribute(n, "day", e)

# with repulsive edge labels
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges() +
  geom_edgetext_repel(aes(label = day), box.padding = unit(0.5, "lines")) +
  geom_nodes(size = 4, color = "grey50") +
  theme_blank()

# repulsive edge labels for only a subset of all edges
edge_day <- function(x) { x[ x$day > 2, ] }
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(aes(color = cut(day, (4:0)[ -3 ]))) +
  geom_edgetext_repel(aes(label = paste("day", day),
                      color = cut(day, (4:0)[ -3 ])), data = edge_day) +
  geom_nodes(size = 4, color = "grey50") +
  scale_color_manual("day", labels = c("old ties", "day 3", "day 4"),
                     values = c("grey50", "gold", "tomato")) +
  theme_blank()

}



