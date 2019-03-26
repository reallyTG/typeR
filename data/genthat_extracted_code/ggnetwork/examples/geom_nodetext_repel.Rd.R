library(ggnetwork)


### Name: geom_nodetext_repel
### Title: Draw repulsive node labels
### Aliases: geom_nodelabel_repel geom_nodetext_repel

### ** Examples

## geom_nodetext_repel example

if (require(network) && require(sna)) {

n <- network(rgraph(10, tprob = 0.2), directed = FALSE)
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "steelblue") +
  geom_nodetext_repel(aes(label = paste("node", vertex.names)),
                      box.padding = unit(1, "lines")) +
  geom_nodes(color = "steelblue", size = 3) +
  theme_blank()

}
## geom_nodelabel_repel examples

if (require(network) && require(sna)) {

data(flo, package = "network")
n <- network(flo, directed = FALSE)

ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "steelblue") +
  geom_nodelabel_repel(aes(label = vertex.names),
                      box.padding = unit(1, "lines")) +
  geom_nodes(color = "steelblue", size = 3) +
  theme_blank()

# label only a subset of all nodes
n %v% "degree" <- degree(n)
low_degree <- function(x) { x[ x$degree < median(x$degree), ] }
ggplot(n, aes(x, y, xend = xend, yend = yend)) +
  geom_edges(color = "steelblue") +
  geom_nodelabel_repel(aes(label = vertex.names),
                       box.padding = unit(1.5, "lines"),
                       data = low_degree,
                       segment.color = "tomato",
                       color = "white", fill = "tomato") +
  geom_nodes(aes(size = degree), color = "steelblue") +
  theme_blank()

}



