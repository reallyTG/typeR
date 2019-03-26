library(igraph)


### Name: graph_attr<-
### Title: Set all or some graph attributes
### Aliases: graph_attr<- graph.attributes<-

### ** Examples

g <- make_graph(~ A - B:C:D)
graph_attr(g, "name") <- "4-star"
g

graph_attr(g) <- list(layout = layout_with_fr(g),
                       name = "4-star layed out")
plot(g)



