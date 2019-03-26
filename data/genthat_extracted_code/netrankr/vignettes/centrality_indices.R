## ----setup, warning=FALSE,message=FALSE----------------------------------
library(netrankr)
library(igraph)
library(magrittr)

## ----standardcent,eval=F-------------------------------------------------
#  g <- graph.empty(n=11,directed = FALSE)
#  g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
#                     6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
#  V(g)$name <- 1:11
#  
#  #Degree
#  g %>%
#    indirect_relations(type="adjacency") %>%
#    aggregate_positions(type="sum")
#  #Closeness
#  g %>%
#    indirect_relations(type="dist_sp") %>%
#    aggregate_positions(type="invsum")
#  #Betweenness Centrality
#  g %>%
#    indirect_relations(type="depend_sp") %>%
#    aggregate_positions(type="sum")
#  #Eigenvector Centrality
#  g %>%
#    indirect_relations(type="walks",FUN=walks_limit_prop) %>%
#    aggregate_positions(type="sum")

## ----closeness_variant, eval=F-------------------------------------------
#  #harmonic closeness
#  g %>%
#    indirect_relations(type="dist_sp",FUN=dist_inv) %>%
#    aggregate_positions(type="sum")

## ----distance_indices,eval=F---------------------------------------------
#  #residual closeness (Dangalchev,2006)
#  g %>%
#    indirect_relations(type="dist_sp",FUN=dist_2pow) %>%
#    aggregate_positions(type="sum")
#  
#  #generalized closeness (Agneessens et al.,2017) (alpha>0)
#  g %>%
#    indirect_relations(type="dist_sp",FUN=dist_dpow,alpha=2) %>%
#    aggregate_positions(type="sum")
#  
#  #decay centrality (Jackson, 2010) (alpha in [0,1])
#  g %>%
#    indirect_relations(type="dist_sp",FUN=dist_powd,alpha=0.7) %>%
#    aggregate_positions(type="sum")
#  
#  #integration centrality (Valente & Foreman, 1998)
#  dist_integration <- function(x){
#    x <- 1 - (x - 1)/max(x)
#  }
#  g %>%
#    indirect_relations(type="dist_sp",FUN=dist_integration) %>%
#    aggregate_positions(type="sum")
#  

## ----othercent,eval=F----------------------------------------------------
#  #subgraph centrality
#  g %>%
#    indirect_relations(type="walks",FUN=walks_exp) %>%
#    aggregate_positions(type="self")
#  #communicability centrality
#  g %>%
#    indirect_relations(type="walks",FUN=walks_exp) %>%
#    aggregate_positions(type="sum")
#  #odd subgraph centrality
#  g %>%
#    indirect_relations(type="walks",FUN=walks_exp_odd) %>%
#    aggregate_positions(type="self")
#  #even subgraph centrality
#  g %>%
#    indirect_relations(type="walks",FUN=walks_exp_even) %>%
#    aggregate_positions(type="self")
#  #katz status
#  g %>%
#    indirect_relations(type="walks",FUN=walks_attenuated) %>%
#    aggregate_positions(type="sum")

## ----index_func----------------------------------------------------------
degree_centrality <- function(g){
  DC <- g %>% 
    indirect_relations(type="adjacency") %>% 
    aggregate_positions(type="sum")
  return(DC)
}

