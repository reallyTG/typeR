## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(rsppfp)
library(foreach)
library(doParallel)
library(dplyr)

## ------------------------------------------------------------------------
# Create a new graph and show it.
# Each graph can be read from different sources, but that is not the scope of rsppfp.
g <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"), 
                to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"), 
                cost = c(1L, 3L, 1L, 1L, 5L, 1L, 6L, 1L, 1L, 1L, 1L, 7L, 8L), 
                stringsAsFactors = FALSE)

# Create a list of forbidden paths, for the graph g
f <- data.frame(V1 = c("s", "u"), V2 = c("u", "v"), V3 = c("v", "y"), V4 = c("t", "u"), 
                stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
library(rsppfp)
modify_graph_vd(g, f)

## ------------------------------------------------------------------------
library(rsppfp)
modify_graph_hsu(g, f, cores = 1L)


