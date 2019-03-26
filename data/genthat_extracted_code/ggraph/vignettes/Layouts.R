## ---- message=FALSE------------------------------------------------------
library(ggraph)
library(igraph)
set_graph_style(plot_margin = margin(1,1,1,1))
graph <- graph_from_data_frame(highschool)

# Not specifying the layout - defaults to "auto"
ggraph(graph) + 
    geom_edge_link(aes(colour = factor(year))) + 
    geom_node_point()

## ------------------------------------------------------------------------
ggraph(graph, layout = 'kk') + 
    geom_edge_link(aes(colour = factor(year))) + 
    geom_node_point()

## ------------------------------------------------------------------------
ggraph(graph, layout = 'kk', maxiter = 100) + 
    geom_edge_link(aes(colour = factor(year))) + 
    geom_node_point()

## ------------------------------------------------------------------------
layout <- create_layout(graph, layout = 'drl')
ggraph(layout) + 
    geom_edge_link(aes(colour = factor(year))) + 
    geom_node_point()

## ------------------------------------------------------------------------
head(layout)

## ------------------------------------------------------------------------
attributes(layout)

## ------------------------------------------------------------------------
# An arc diagram
ggraph(graph, layout = 'linear') + 
    geom_edge_arc(aes(colour = factor(year)))

## ------------------------------------------------------------------------
# A coord diagram
ggraph(graph, layout = 'linear', circular = TRUE) + 
    geom_edge_arc(aes(colour = factor(year))) + 
    coord_fixed()

## ------------------------------------------------------------------------
graph <- graph_from_data_frame(flare$edges, vertices = flare$vertices)
# An icicle plot
ggraph(graph, 'partition') + 
    geom_node_tile(aes(fill = depth), size = 0.25)

## ------------------------------------------------------------------------
# A sunburst plot
ggraph(graph, 'partition', circular = TRUE) + 
    geom_node_arc_bar(aes(fill = depth), size = 0.25) + 
    coord_fixed()

## ---- fig.show='hold', results='hide'------------------------------------
graph <- graph_from_data_frame(highschool)
V(graph)$degree <- degree(graph)
lapply(c('fr', 'kk', 'lgl', 'graphopt'), function(layout) {
    ggraph(graph, layout = layout) + 
        geom_edge_link(aes(colour = factor(year)), show.legend = FALSE) +
        geom_node_point() + 
        labs(caption = paste0('Layout: ', layout))
})

## ------------------------------------------------------------------------
V(graph)$friends <- degree(graph, mode = 'in')
V(graph)$friends <- ifelse(V(graph)$friends < 5, 'few', 
                           ifelse(V(graph)$friends >= 15, 'many', 'medium'))
ggraph(graph, 'hive', axis = 'friends', sort.by = 'degree') + 
    geom_edge_hive(aes(colour = factor(year))) + 
    geom_axis_hive(aes(colour = friends), size = 2, label = FALSE) + 
    coord_fixed()

## ------------------------------------------------------------------------
graph <- graph_from_data_frame(flare$edges, vertices = flare$vertices)
set.seed(1)
ggraph(graph, 'circlepack', weight = 'size') + 
    geom_node_circle(aes(fill = depth), size = 0.25, n = 50) + 
    coord_fixed()

## ------------------------------------------------------------------------
set.seed(1)
ggraph(graph, 'circlepack', weight = 'size') + 
    geom_edge_link() + 
    geom_node_point(aes(colour = depth)) +
    coord_fixed()

## ------------------------------------------------------------------------
ggraph(graph, 'treemap', weight = 'size') + 
    geom_node_tile(aes(fill = depth), size = 0.25)

## ------------------------------------------------------------------------
ggraph(graph, 'treemap', weight = 'size') + 
    geom_edge_link() + 
    geom_node_point(aes(colour = depth))

## ------------------------------------------------------------------------
ggraph(graph, 'dendrogram') + 
    geom_edge_diagonal()

## ------------------------------------------------------------------------
dendrogram <- as.dendrogram(hclust(dist(iris[, 1:4])))
ggraph(dendrogram, 'dendrogram') + 
    geom_edge_elbow()

## ------------------------------------------------------------------------
ggraph(dendrogram, 'dendrogram', circular = TRUE) + 
    geom_edge_elbow() + 
    coord_fixed()

