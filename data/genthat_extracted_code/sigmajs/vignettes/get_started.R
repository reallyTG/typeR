## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(htmltools)
library(sigmajs)

## ---- eval = TRUE--------------------------------------------------------
# generate data using convenience functions
nodes <- sg_make_nodes()
edges <- sg_make_edges(nodes)

sigmajs() %>%
  sg_nodes(nodes, id, size, color) %>%
  sg_edges(edges, id, source, target)

## ------------------------------------------------------------------------
sigmajs() %>%
  sg_nodes(nodes, id, size) %>%
  sg_edges(edges, id, source, target) %>%
  sg_settings(defaultNodeColor = "#c9423f") # pass default color

## ---- echo=FALSE---------------------------------------------------------
tags$a(
  class = "btn btn-default",
  href = "layout.html",
  "Layouts ",
  tags$i(
    class = "fa fa-arrow-right"
  )
)

