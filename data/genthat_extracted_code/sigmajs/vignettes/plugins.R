## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(htmltools)
library(sigmajs)

## ------------------------------------------------------------------------
nodes <- sg_make_nodes(100)
edges <- sg_make_edges(nodes, 75)

# add type
TYPES <- c("dashed", "dotted", "tapered", "parallel", "curve")
edges$type <- sample(TYPES, nrow(edges), replace = TRUE)

sigmajs() %>%
  sg_nodes(nodes, id, color) %>%
  sg_edges(edges, id, source, target, type) %>%
  sg_force() %>% # start forceAtlas2
  sg_relative_size() %>% # size node relative to one another
  sg_drag_nodes() %>% # enable drag nodes
  sg_force_stop(10000) # stop layout algo after 10 seconds

## ------------------------------------------------------------------------
IMG <- c(
	'https://avatars0.githubusercontent.com/u/163582?s=400&v=4',
	'https://avatars1.githubusercontent.com/u/4196?s=400&v=4',
	'https://avatars3.githubusercontent.com/u/129551?s=400&v=4'
)
SHAPES <- c("circle", "square", "diamond")

nodes$url <- sample(IMG, nrow(nodes), replace = TRUE) # add images
nodes$type <- sample(SHAPES, nrow(nodes), replace = TRUE) # custom shapes
nodes$scale <- 1.3
nodes$clip <- 0.85

sigmajs() %>%
  sg_nodes(nodes, id, color, size, type) %>%
  sg_edges(edges, id, source, target) %>%
  sg_layout() %>% 
  sg_add_images(nodes, url, scale, clip) %>%
  sg_settings(defaultNodeColor = "#0011ff", minNodeSize = 8, maxNodeSize = 16) 

## ------------------------------------------------------------------------
nodes <- sg_make_nodes()
edges <- sg_make_edges(nodes)

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_export_svg() %>% 
  sg_layout() %>% 
  sg_button( 
    "export_svg", 
    tags$i(class = "fa fa-download"),
    class = "btn btn-success",
    tag = tags$a
  )

## ------------------------------------------------------------------------
nodes <- sg_make_nodes(50)
edges <- sg_make_edges(nodes)

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>%
  sg_layout() %>% 
  sg_neighbours()

