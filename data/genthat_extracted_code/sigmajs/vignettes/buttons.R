## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(htmltools)
library(sigmajs)

## ------------------------------------------------------------------------
nodes <- sg_make_nodes() 
edges <- sg_make_edges(nodes)

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout() %>% 
  sg_export_svg() %>% 
  sg_button(
    "export_svg", # event to trigger
    class = "btn btn-default",
    tag = tags$a,
    tags$i(class = "fa fa-download")
  )

## ------------------------------------------------------------------------
sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_force_start() %>% 
  sg_force_stop(3000) %>% 
  sg_button(
    c("force_start", "force_stop"), 
    class = "btn btn-success",
    tag = tags$a,
    tags$i(class = "fa fa-play"), "layout" # only use icon if document imports fontawesome
  )

## ------------------------------------------------------------------------
# initial nodes
nodes <- sg_make_nodes()

# additional nodes
nodes2 <- sg_make_nodes()
nodes2$id <- as.character(seq(11, 20))

# add delay
nodes2$delay <- runif(nrow(nodes2), 500, 1000)
nodes2$text <- seq.Date(Sys.Date(), Sys.Date() + 9, "days")

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color) %>%
  sg_add_nodes(nodes2, delay, id, label, size, color) %>% 
  sg_progress(nodes2, delay, text, tag = tags$h3) %>%
  sg_force() %>% 
  sg_button(c("add_nodes", "progress"), "add", tag = tags$a, position = "bottom") %>% 
  sg_button("force_start", "force", tag = tags$a, position = "bottom")

