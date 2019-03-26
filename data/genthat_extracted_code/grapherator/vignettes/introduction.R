## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", warning = FALSE, message = FALSE, fig.align = "center")
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ---- echo = FALSE, out.width = '75%', fig.align = 'center'--------------
knitr::include_graphics("grapherator_workflow.png")

## ---- fig.width=8, fig.height=4.2, out.width='100%', fig.cap='Example network.'----
library(grapherator)
set.seed(1) # reproducability
g = graph(lower = 0, upper = 10)
g = addNodes(g, n = 20, generator = addNodesUniform)
g = addEdges(g, generator = addEdgesComplete)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 5, max = 10)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 5, max = 10)
print(g)
do.call(gridExtra::grid.arrange, c(plot(g), list(nrow = 1)))

## ---- fig.width=8, fig.height=4.2, out.width='100%', fig.cap='Example network.'----
library(grapherator)
set.seed(1) # reproducability
g = graph(lower = 0, upper = 100)
g = addNodes(g, n = 50, generator = addNodesUniform)
g = addEdges(g, generator = addEdgesDelauney)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 10, max = 20)
g = addWeights(g, generator = addWeightsRandom, method = rnorm, mean = 10, sd = 2)
print(g)
do.call(gridExtra::grid.arrange, c(plot(g), list(nrow = 1L)))

## ---- fig.width=8, fig.height=4.2, out.width='100%', fig.cap='Example network.'----
library(grapherator)
set.seed(1) # reproducability
g = graph(lower = c(0, 50), upper = c(100, 100))
#g = addNodes(g, n = 7, generator = addNodesUniform)
g = addNodes(g, n = 7, generator = addNodesLHS)
g = addNodes(g, n = 29, by.centers = TRUE, generator = addNodesUniform, lower = c(0, 0), upper = c(10, 10))
g = addEdges(g, generator = addEdgesWaxman, alpha = 0.3, beta = 0.1)
g = addWeights(g, generator = addWeightsCorrelated, rho = 0.7)
print(g)
do.call(gridExtra::grid.arrange, c(plot(g), list(nrow = 1L)))

## ---- fig.width=8, fig.height=4.2, out.width='100%', fig.cap='Example network.'----
library(grapherator)
set.seed(1) # reproducability
g = graph(lower = 0, upper = 100)
g = addNodes(g, n = 5, coordinates = matrix(c(10, 10, 20, 20, 30, 30, 10, 20, 40, 10), byrow = 2, ncol = 2))
g = addNodes(g, n = 10, by.centers = TRUE, generator = addNodesNormal, x.mean = 5, y.mean = 5, x.sd = 2, y.sd = 2, lower = c(0, 0), upper = c(10, 10))
g = addEdges(g, generator = addEdgesGilbert, p = 0.2, type = "intracluster")
g = addEdges(g, generator = addEdgesSpanningTree, type = "intracluster")
g = addEdges(g, generator = addEdgesDelauney, type = "intercenter")
g = addWeights(g, generator = addWeightsDistance, method = "manhattan")
g = addWeights(g, generator = addWeightsRandom, method = rexp, rate = 0.1)
print(g)
do.call(gridExtra::grid.arrange, c(plot(g), list(nrow = 1L)))

