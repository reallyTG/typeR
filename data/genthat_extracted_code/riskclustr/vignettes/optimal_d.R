## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(riskclustr)

res <- optimal_kmeans_d(
  markers = c(paste0("y", seq(1:30))),
  M = 3,
  factors = list("x1", "x2", "x3"),
  case = "case",
  data = subtype_data,
  nstart = 100,
  seed = 81110224)

## ------------------------------------------------------------------------
table(res[["optimal_d_data"]]$optimal_d_label)

## ------------------------------------------------------------------------
res[["optimal_d"]]

