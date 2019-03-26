## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(kdtools)
x = matrix(runif(3e3), nc = 3)
y = matrix_to_tuples(x)
y[1:3, c(1, 3)]

## ------------------------------------------------------------------------
kd_sort(y, inplace = TRUE, parallel = TRUE)

## ------------------------------------------------------------------------
rq = kd_range_query(y, c(0, 0, 0), c(1/4, 1/4, 1/4)); rq
i = kd_nearest_neighbor(y, c(0, 0, 0)); y[i, ]
nns = kd_nearest_neighbors(y, c(0, 0, 0), 100); nns

## ------------------------------------------------------------------------
head(tuples_to_matrix(rq))
head(tuples_to_matrix(nns))

