## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(sigmajs)

## ------------------------------------------------------------------------
data("lesmis_igraph") # load dataset

sigmajs() %>%
  sg_from_igraph(lesmis_igraph) %>%
  sg_settings(drawLabels = FALSE, drawEdgeLabels = FALSE)

## ------------------------------------------------------------------------
layout <- igraph::layout_on_grid(lesmis_igraph) # create layout

sigmajs() %>%
  sg_from_igraph(lesmis_igraph, layout) %>%
  sg_settings(drawLabels = FALSE, drawEdgeLabels = FALSE)

## ------------------------------------------------------------------------
gexf <- system.file("examples/arctic.gexf", package = "sigmajs")

sigmajs() %>% 
  sg_from_gexf(gexf) %>%
  sg_settings(drawLabels = FALSE, drawEdgeLabels = FALSE)

