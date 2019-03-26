## ---- message=FALSE------------------------------------------------------
library(ggraph)
library(igraph)
set_graph_style(plot_margin = margin(1,1,1,1))
gr <- graph_from_data_frame(highschool)

ggraph(gr, layout = 'kk') + 
    geom_point(aes(x=x, y=y))

## ------------------------------------------------------------------------
head(create_layout(gr, layout = 'kk'))

## ------------------------------------------------------------------------
ggraph(gr, layout = 'kk') + 
    geom_node_point()

## ------------------------------------------------------------------------
gr <- graph_from_data_frame(flare$edges, vertices = flare$vertices)

ggraph(gr, layout = 'partition') + 
    geom_node_tile(aes(y = -y, fill = depth))

## ------------------------------------------------------------------------
ggraph(gr, layout = 'dendrogram', circular = TRUE) + 
    geom_edge_diagonal() + 
    geom_node_point(aes(filter = leaf)) + 
    coord_fixed()

## ------------------------------------------------------------------------
ggraph(gr, layout = 'treemap', weight = 'size') + 
    geom_node_tile(aes(fill = depth))

## ------------------------------------------------------------------------
l <- ggraph(gr, layout = 'partition', circular = TRUE)
l + geom_node_arc_bar(aes(fill = depth)) + 
    coord_fixed()

## ------------------------------------------------------------------------
l + geom_edge_diagonal() + 
    geom_node_point(aes(colour = depth)) + 
    coord_fixed()

