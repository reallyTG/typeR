## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", warning = FALSE, message = FALSE)
options(tibble.print_min = 4L, tibble.print_max = 4L)

## ---- fig.width=8, out.width='100%', message=FALSE-----------------------
library(mcMST)

g = mcGP(lower = 0, upper = 1)
g = addWeights(g, method = "random", weight.fun = runif, min = 10, max = 20, n = 50)
g = addWeights(g, method = "random", weight.fun = runif, min = 20, max = 100)
plot(g)$pl.weights

## ---- fig.width=8, out.width='100%'--------------------------------------
g = mcGP(lower = 0, upper = 100)
g = addCoordinates(g, n = 30, generator = coordUniform)
g = addWeights(g, method = "euclidean")
g = addWeights(g, method = "random", weight.fun = rnorm, mean = 40, sd = 5)
print(g)
library(gridExtra)
do.call(grid.arrange, c(plot(g), nrow = 1))

## ---- fig.width=8, out.width='100%'--------------------------------------
g = mcGP(lower = 0, upper = 10)
g = addCenters(g, n.centers = 3, generator = coordLHS)
g = addCoordinates(g, n = c(10, 20, 70), by.centers = TRUE, generator = coordUniform,
  lower = c(0, 0), upper = c(1, 1))
g = addCoordinates(g, n = 20, generator = coordUniform)
g = addWeights(g, method = "manhattan")
g = addWeights(g, method = "random", weight.fun = rchisq, df = 10)
do.call(grid.arrange, c(plot(g), nrow = 1))

