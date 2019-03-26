## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", warning = FALSE, message = FALSE, fig.align = "center")
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ---- fig.width=8, fig.height=4.2, out.width='100%', fig.cap='Example network.'----
library(grapherator)
library(magrittr)

set.seed(1) # reproducability
g = graph(lower = 0, upper = 10) %>%
  addNodes(n = 20, generator = addNodesUniform) %>%
  addEdges(generator = addEdgesComplete) %>%
  addWeights(generator = addWeightsRandom, method = runif, min = 5, max = 10) %>%
  addWeights(generator = addWeightsRandom, method = runif, min = 5, max = 10)
print(g)
do.call(gridExtra::grid.arrange, c(plot(g), list(nrow = 1)))

