## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(htmltools)

## ------------------------------------------------------------------------
library(DT)
library(sigmajs)
library(crosstalk)

nodes <- sg_make_nodes(20)
edges <- sg_make_edges(nodes)

# pass node ids as keys
sd <- SharedData$new(nodes, key = nodes$id)

div(
  class = "row",
  div(
    class = "col-md-6",
    sigmajs() %>% 
      sg_nodes(sd, id, color, size, label) %>% 
      sg_edges(edges, id, source, target) %>% 
      sg_layout() %>% 
      sg_settings(
        mouseWheelEnabled = FALSE
      )
  ),
  div(
    class = "col-md-6",
    datatable(sd, style = "bootstrap", class = "compact", width = "100%",
      selection = "single")
  )
)

## ---- warning=FALSE------------------------------------------------------
library(DT)
library(sigmajs)
library(crosstalk)

g <- igraph::make_graph(sample(LETTERS, 50, replace = TRUE))

vertices <- igraph::as_data_frame(g, what = "vertices")
sd <- SharedData$new(vertices, key = vertices$name)

div(
  class = "row",
  div(
    class = "col-md-6",
    sigmajs() %>% 
      sg_from_igraph(g, sd = sd) %>% 
      sg_neighbours() %>% 
      sg_settings(
        mouseWheelEnabled = FALSE,
        defaultNodeColor = "#98D3A5"
      )
  ),
  div(
    class = "col-md-6",
    datatable(sd, style = "bootstrap", class = "compact", width = "100%",
      selection = "single")
  )
)

