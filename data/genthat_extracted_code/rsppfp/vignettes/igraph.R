## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(rsppfp)
library(igraph)
library(foreach)
library(doParallel)
library(dplyr)

## ------------------------------------------------------------------------
# Load the sample graph
graph <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                    to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                    cost = c(1L, 4L, 1L, 2L, 7L, 1L, 2L, 5L, 1L, 4L, 1L, 3L, 9L),
                    stringsAsFactors = FALSE)

# Load the forbidden paths
fpaths <- data.frame(V1 = c("u", "u", "w", "x"), V2 = c("v", "w", "v","w"), V3 = c("y", "y", "y", "v"),
                     V4 = c("u", "u", NA, "y"), V5 = c(NA, NA, NA, "t"), stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
# Run the algorithm and transform the graph
gStar <- modify_graph_hsu(graph, fpaths)
gStar

## ------------------------------------------------------------------------
# Transform gStar to igraph's data format
gStar.igraph <- graph_from_data_frame(gStar)

## ---- fig.show='hold'----------------------------------------------------
# This can be used to plot the graph
plot(gStar.igraph, edge.arrow.size = 0.5, vertex.size = 20, xlab = "Graph", 
     vertex.color = "#F1F1F1", vertex.label.color = "#050505")

## ------------------------------------------------------------------------
# This can be used to plot the graph
get_all_nodes(gStar, "v")

## ---- eval=FALSE---------------------------------------------------------
#  get_shortest_path <- function(g, origin, dest, weightColName) {
#    #If there is no weight column
#    if(!weightColName %in% colnames(g)) {
#      g$weight <- 1
#      weightColName <- "weight"
#    }
#  
#    # Convert the graph
#    g.i <- graph_from_data_frame(g)
#  
#  
#    # Get all nodes where for the destination is the destination
#    destEq <- get_all_nodes(gStar, dest)
#  
#    # Find shortest paths from "s" to all N* corresponding to "w"
#    sp <- shortest_paths(gStar.igraph, from = origin, to = destEq,
#                         weights = gStar$weightColName, output = "both")
#  
#  
#    # Find shortest of these paths
#    dist <- vapply(sp$epath, function(path) sum(path$weightColName), numeric(1))
#    shortestPath <- sp$vpath[[which.min(dist)]]
#  
#    # Convert path with nodes from N* to path with nodes from N
#    return( parse_vpath(names(shortestPath)) )
#  }

## ---- warning=FALSE------------------------------------------------------
# Obtain the shortest path using the simplified function
shortestPath <- get_shortest_path(gStar, "u", "t", "cost")
shortestPath

