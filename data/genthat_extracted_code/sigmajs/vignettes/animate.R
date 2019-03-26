## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(sigmajs)

## ------------------------------------------------------------------------
# generate data
nodes <- sg_make_nodes(30)
edges <- sg_make_edges(nodes)

# add transitions
n <- nrow(nodes)
nodes$to_x <- runif(n, 5, 10)
nodes$to_y <- runif(n, 5, 10)
nodes$to_size <- runif(n, 5, 10)
nodes$to_color <- sample(c("#ffe66d", "#e85d75"), n, replace = TRUE)

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color, to_x, to_y, to_size, to_color) %>%
  sg_edges(edges, id, source, target) %>% 
  sg_animate(mapping = list(x = "to_x", y = "to_y", size = "to_size", color = "to_color")) %>%
  sg_settings(animationsTime = 2000)

## ------------------------------------------------------------------------
layout <- sg_get_layout(nodes, edges)

nodes$to_x <- layout$x
nodes$to_y <- layout$y

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color, to_x, to_y, to_size, to_color) %>%
  sg_edges(edges, id, source, target) %>% 
  sg_animate(mapping = list(x = "to_x", y = "to_y", size = "to_size", color = "to_color")) %>%
  sg_settings(animationsTime = 2000)

## ------------------------------------------------------------------------
sigmajs() %>%
  sg_nodes(nodes, id, label, size, color, to_x, to_y, to_size, to_color) %>%
  sg_edges(edges, id, source, target) %>% 
  sg_animate(mapping = list(x = "to_x", y = "to_y", size = "to_size", color = "to_color"),
             delay = 0) %>%
  sg_settings(animationsTime = 3500) %>% 
  sg_button(
    "animate", # button label 
    "animate", # event name
    class = "btn btn-warning"
  )

