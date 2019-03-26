## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", warning = FALSE, message = FALSE, fig.align = "center")
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ------------------------------------------------------------------------
library(grapherator)

addEdgesThreshold = function(graph, threshold, ...) {
  n = getNumberOfNodes(graph)
  coords = getNodeCoordinates(graph)

  # compute distances
  dists = as.matrix(dist(coords, method = "euclidean", ...))

  # define adjacency matrix
  adj.mat = dists < threshold

  # no loops allowed
  diag(adj.mat) = FALSE

  # return required format
  return(list(adj.mat = adj.mat, generator = "ThEG"))
}

## ---- fig.width=8, fig.height=8, out.width='50%', fig.cap='Example network.'----
set.seed(1) # reproducability
g = graph(lower = 0, upper = 100)
g = addNodes(g, n = 25, generator = addNodesUniform)
g = addEdges(g, generator = addEdgesThreshold, threshold = 30)
# weight generation is skipped here
plot(g)$pl.coords

## ---- fig.width=8, fig.height=8, out.width='50%', fig.cap='Example network.'----
set.seed(1) # reproducability
g = graph(lower = 0, upper = 100)
g = addNodes(g, n = 5, generator = addNodesUniform)
g = addNodes(g, n = 25, by.centers = TRUE, generator = addNodesGrid, lower = c(0, 0), upper = c(15, 15))
g = addEdges(g, generator = addEdgesThreshold, threshold = 13, type = "intracluster")
g = addEdges(g, generator = addEdgesDelauney, type = "intercenter")
# weight generation is skipped here
plot(g)$pl.coords

