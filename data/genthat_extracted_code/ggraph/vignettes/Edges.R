## ---- message=FALSE------------------------------------------------------
library(ggraph)
library(igraph)
set_graph_style(plot_margin = margin(1,1,1,1))
hierarchy <- as.dendrogram(hclust(dist(iris[, 1:4])))

# Classify nodes based on agreement between children
hierarchy <- tree_apply(hierarchy, function(node, children, ...) {
    if (is.leaf(node)) {
        attr(node, 'Class') <- as.character(iris[as.integer(attr(node, 'label')),5])
    } else {
        classes <- unique(sapply(children, attr, which = 'Class'))
        if (length(classes) == 1 && !anyNA(classes)) {
            attr(node, 'Class') <- classes
        } else {
            attr(node, 'Class') <- NA
        }
    }
    attr(node, 'nodePar') <- list(class = attr(node, 'Class'))
    node
}, direction = 'up')

hairball <- graph_from_data_frame(highschool)

# Classify nodes based on popularity gain
pop1957 <- degree(delete_edges(hairball, which(E(hairball)$year == 1957)), 
                  mode = 'in')
pop1958 <- degree(delete_edges(hairball, which(E(hairball)$year == 1958)), 
                  mode = 'in')
V(hairball)$pop_devel <- ifelse(pop1957 < pop1958, 'increased',
                                ifelse(pop1957 > pop1958, 'decreased', 
                                       'unchanged'))
V(hairball)$popularity <- pmax(pop1957, pop1958)
E(hairball)$year <- as.character(E(hairball)$year)

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'kk') + 
    geom_edge_link(aes(colour = year))

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'kk') + 
    geom_edge_fan(aes(colour = year))

## ------------------------------------------------------------------------
# let's make some of the student love themselves
loopy_hairball <- add_edges(hairball, rep(1:5, each=2), year = rep('1957', 5))
ggraph(loopy_hairball, layout = 'kk') + 
    geom_edge_link(aes(colour = year), alpha = 0.25) + 
    geom_edge_loop(aes(colour = year))

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'kk') + 
    geom_edge_density(aes(fill = year)) + 
    geom_edge_link(alpha = 0.25)

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'linear') + 
    geom_edge_arc(aes(colour = year))

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'linear', circular = TRUE) + 
    geom_edge_arc(aes(colour = year)) + 
    coord_fixed()

## ------------------------------------------------------------------------
ggraph(hierarchy, layout = 'dendrogram') + 
    geom_edge_elbow()

## ------------------------------------------------------------------------
ggraph(hierarchy, layout = 'dendrogram') + 
    geom_edge_diagonal()

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'hive', axis = 'pop_devel', sort.by = 'popularity') + 
    geom_edge_hive(aes(colour = year)) + 
    geom_axis_hive(label = FALSE) + 
    coord_fixed()

## ------------------------------------------------------------------------
ggraph(hairball, layout = 'linear') + 
    geom_edge_arc(aes(colour = year, alpha = ..index..)) + 
    scale_edge_alpha('Edge direction', guide = 'edge_direction')

## ------------------------------------------------------------------------
ggraph(hierarchy, layout = 'dendrogram') + 
    geom_edge_elbow2(aes(colour = node.class))

## ------------------------------------------------------------------------
simple <- make_graph('bull')
# Random names - I swear
V(simple)$name <- c('Thomas', 'Bob', 'Hadley', 'Winston', 'Baptiste')
E(simple)$type <- sample(c('friend', 'foe'), 5, TRUE)

## ------------------------------------------------------------------------
ggraph(simple, layout = 'graphopt') + 
    geom_edge_link(arrow = arrow(length = unit(4, 'mm'))) + 
    geom_node_point(size = 5)

## ------------------------------------------------------------------------
ggraph(simple, layout = 'graphopt') + 
    geom_edge_link(arrow = arrow(length = unit(4, 'mm')), 
                   end_cap = circle(3, 'mm')) + 
    geom_node_point(size = 5)

## ------------------------------------------------------------------------
ggraph(simple, layout = 'linear', circular = TRUE) + 
    geom_edge_arc(arrow = arrow(length = unit(4, 'mm')), 
                  start_cap = circle(3, 'mm'),
                  end_cap = circle(3, 'mm')) + 
    geom_node_point(size = 5) + 
    coord_fixed()

## ------------------------------------------------------------------------
ggraph(simple, layout = 'graphopt') + 
    geom_edge_link(aes(start_cap = label_rect(node1.name),
                       end_cap = label_rect(node2.name)), 
                   arrow = arrow(length = unit(4, 'mm'))) + 
    geom_node_text(aes(label = name))

## ------------------------------------------------------------------------
ggraph(simple, layout = 'graphopt') + 
    geom_edge_link(aes(label = type), 
                   arrow = arrow(length = unit(4, 'mm')), 
                   end_cap = circle(3, 'mm')) + 
    geom_node_point(size = 5)

## ------------------------------------------------------------------------
ggraph(simple, layout = 'graphopt') + 
    geom_edge_link(aes(label = type), 
                   angle_calc = 'along',
                   label_dodge = unit(2.5, 'mm'),
                   arrow = arrow(length = unit(4, 'mm')), 
                   end_cap = circle(3, 'mm')) + 
    geom_node_point(size = 5)

## ------------------------------------------------------------------------
flaregraph <- graph_from_data_frame(flare$edges, vertices = flare$vertices)
from <- match(flare$imports$from, flare$vertices$name)
to <- match(flare$imports$to, flare$vertices$name)
ggraph(flaregraph, layout = 'dendrogram', circular = TRUE) + 
    geom_conn_bundle(data = get_con(from = from, to = to), alpha = 0.1) + 
    coord_fixed()

