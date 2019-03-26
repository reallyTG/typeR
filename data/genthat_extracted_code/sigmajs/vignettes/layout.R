## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(sigmajs)

## ------------------------------------------------------------------------
# generate data using convenience functions
nodes <- sg_make_nodes(50)
edges <- sg_make_edges(nodes)

sigmajs() %>%
  sg_nodes(nodes, id, size, color) %>%
  sg_edges(edges, id, source, target) %>%
  sg_layout(FALSE, igraph::layout_with_fr) # pass layout FUN

## ------------------------------------------------------------------------
sigmajs() %>%
  sg_force_start() %>% # start
  sg_nodes(nodes, id, size, color) %>%
  sg_edges(edges, id, source, target) %>%
  sg_force_stop(5000) # stop after 5 seconds

