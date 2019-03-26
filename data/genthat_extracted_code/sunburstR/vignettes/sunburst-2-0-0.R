## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(sunburstR)
packageVersion("sunburstR")

## ------------------------------------------------------------------------
library(htmltools)
library(d3r)

dat <- data.frame(
  level1 = rep(c("a", "b"), each=3),
  level2 = paste0(rep(c("a", "b"), each=3), 1:3),
  size = c(10,5,2,3,8,6),
  stringsAsFactors = FALSE
)

knitr::kable(dat)

## ------------------------------------------------------------------------
library(d3r)
tree <- d3_nest(dat, value_cols = "size")
tree

## ------------------------------------------------------------------------
sb1 <- sunburst(tree, width="100%", height=400)
sb2 <- sunburst(
  tree,
  legend = FALSE,
  width = "100%",
  height = 400
)

# do side-by-side for comparison
div(
  style="display: flex; align-items:center;",
  div(style="width:50%; border:1px solid #ccc;", sb1),
  div(style="width:50%; border:1px solid #ccc;", sb2)
)

## ------------------------------------------------------------------------
sb3 <- sund2b(tree, width="100%")

div(
  style="display: flex; align-items:center;",
  sb3
)

