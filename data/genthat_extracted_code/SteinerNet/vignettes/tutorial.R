## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE, warning = FALSE-----------------------------------
library(igraph)
library(SteinerNet)

## ------------------------------------------------------------------------
g <- graph("Cubical")

set.seed(4)
terminal_nodes <- generate_st_samples(graph = g, ter_number = 2, prob = 0.1)
terminal_nodes

## ------------------------------------------------------------------------
V(g)$color <- "yellow"
V(g)[terminal_nodes[[1]]]$color <- "red"

plot(g)

## ------------------------------------------------------------------------
steinertree(type = "SP", terminals = terminal_nodes[[1]],
            graph = g, color = FALSE, merge = FALSE)

## ------------------------------------------------------------------------
tree_list <- c()

for (i in 1:20)
        tree_list[[i]] <- steinertree(type = "SP", terminals = terminal_nodes[[1]],
                                      graph = g, color = FALSE, merge = FALSE)

# calculate sizes of trees
tree_list_len <- unlist(lapply(tree_list, function (x) length(E(x[[1]]))))

# select trees with minimal size
index <- which(tree_list_len == min(tree_list_len))

## ------------------------------------------------------------------------
steinertree(type = "KB", terminals = terminal_nodes[[1]],
            graph = g, color = FALSE, merge = FALSE)

## ------------------------------------------------------------------------
steinertree(type = "RSP", terminals = terminal_nodes[[1]],
            graph = g, color = FALSE, merge = FALSE)

## ------------------------------------------------------------------------
steinertree(type = "RSP", terminals = terminal_nodes[[1]],
            graph = g, color = FALSE, merge = FALSE)

## ------------------------------------------------------------------------
steinertree(type = "EXA", terminals = terminal_nodes[[1]],
            graph = g, color = FALSE, merge = FALSE)

## ------------------------------------------------------------------------
steinertree(type = "SPM", terminals = terminal_nodes[[1]],
            graph = g, color = FALSE, merge = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  # in version 2.0
#  # eval = FALSE
#  listofterminaltest <- c(5, 8, 15, 50, 70)
#  repetition <- rep(x = 0.5, 50)

## ---- eval = FALSE-------------------------------------------------------
#  # in version 3.0
#  # eval = FALSE
#  generate_st_samples(graph = #your graph#,
#                      ter_number = rep(x = 5, 50),
#                      prob = rep(x = 5, 50))

## ---- eval = FALSE-------------------------------------------------------
#  # in version 3.0
#  # eval = FALSE
#  generate_st_samples(graph = #your graph#,
#                      ter_number = rep(x = 8, 50),
#                      prob = rep(x = 8, 50))

