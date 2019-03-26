## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(sigmajs)

## ------------------------------------------------------------------------
nodes <- sg_make_nodes()
edges <- sg_make_edges(nodes)

sigmajs() %>% 
  sg_nodes(nodes, id, label, color, size) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout() %>% 
  sg_settings(
    drawEdges = FALSE,
    hoverFontStyle = "bold", # bold labels on hover
    labelColor = "node", # node label color = respective node color
    labelSizeRatio = 2,
    defaultHoverLabelBGColor = "red", # hover label bg
    defaultLabelHoverColor = "white" # hover label text color
  )

