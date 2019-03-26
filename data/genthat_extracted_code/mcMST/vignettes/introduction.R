## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", warning = FALSE, message = FALSE)
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ---- fig.width=8, out.width='100%', fig.cap='Plot of the bi-objective sample graph `g.'----
library(mcMST)
library(gridExtra)
set.seed(1) # reproducability
g = mcGP(lower = 0, upper = 10)
g = addCoordinates(g, n = 25, generator = coordUniform)
g = addWeights(g, method = "euclidean")
g = addWeights(g, method = "random", weight.fun = rnorm, mean = 5, sd = 1.5)
print(g)
plots = plot(g)
plots$nrow = 1
do.call(grid.arrange, plots)

## ---- fig.width=8, out.width='100%', fig.cap="Approximation of the Pareto-front of the benchmark graph instance."----
res = mcMSTEmoaZhou(g, mu = 30L, lambda = 10L, max.iter = 500L)
head(res$pareto.front, n = 5)
ecr::plotFront(res$pareto.front)

