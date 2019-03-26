## ----setup, warning=FALSE,message=FALSE----------------------------------
library(netrankr)
library(igraph)

## ----indirstandard-------------------------------------------------------
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
V(g)$name <- 1:11

#adjacency
A <- indirect_relations(g,type = "identity")
#shortest path distances
D <- indirect_relations(g,type="dist_sp")
#dyadic dependencies (as used in betweenness centrality)
B <- indirect_relations(g,type = "depend_sp")
#resistance distance (as used in information centrality)
R <- indirect_relations(g,type="dist_resist")
#Logarithmic forest distance (parametrized family of distances)
LF <- indirect_relations(g, type = "dist_lf",lfparam = 1) 
#Walk distance (parametrized family of distances)
WD <- indirect_relations(g, type = "dist_walk",dwparam = 0.001) 
#Random walk distance
WD <- indirect_relations(g, type = "dist_rwalk") 
#See ?indirect_relations for further options

## ----indirwalks----------------------------------------------------------
#count the limit proportion of walks (used for eigenvector centrality)
W <-  indirect_relations(g,type = "walks",FUN = walks_limit_prop)
#count the number of walks of arbitrary length between nodes, weighted by 
#the inverse factorial of their length (used for subgraph centrality)
S <-  indirect_relations(g,type = "walks",FUN = walks_exp)

## ----indirparam----------------------------------------------------------
#Calculate dist(s,t)^-alpha
D <- indirect_relations(g,type="dist_sp",FUN=dist_dpow,alpha = 2)

## ----own_func------------------------------------------------------------
dist_integration <- function(x){
  x <- 1 - (x - 1)/max(x)
}
D <- indirect_relations(g,type="dist_sp",FUN=dist_integration)

