## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(sigmajs)

## ------------------------------------------------------------------------
nodes <- sg_make_nodes() 
edges <- sg_make_edges(nodes, 17)

sigmajs() %>% 
  sg_nodes(nodes, id, size) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout() %>% 
  sg_cluster()

## ------------------------------------------------------------------------
set.seed(19880525) # for reproducability

# make a slightly larger graph
nodes <- sg_make_nodes(50)
edges <- sg_make_edges(nodes, 100)

# use the helper
# first run showed 11 clusters
nodes <- sg_get_cluster(
  nodes, edges, colors = c(
    "#331A00", "#663000",
    "#996136", "#CC9B7A",
    "#D9AF98", "#F2DACE",
    "#CCFDFF", "#99F8FF",
    "#66F0FF", "#33E4FF",
    "#00AACC")
  )

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout() %>% 
  sg_neighbours()

